module Skywriter
  module Resource
    module DSL
      def property(name, options = {})
        property_definitions << PropertyDefinition.new(name, options)
      end

      def property_definitions
        @property_definitions ||= []
      end

      private

      def self.extended(base)
        type_name = base.name.gsub("Skywriter::Resource", "AWS")

        base.send(:define_method, :type) do 
          type_name
        end
      end

      class PropertyDefinition
        attr_reader :name, :key

        def initialize(name, options = {})
          @name = name.to_s
          @key = name.to_s.underscore.to_sym
        end
      end
    end

    attr_reader :logical_name

    def initialize(logical_name, options = {})
      @logical_name = logical_name
      @options = options.freeze
    end

    def as_json
      Thread.current[:skywriter_as_json_context] = self

      { logical_name =>
        {
          'Type' => type,
          'Properties' => properties.as_json,
          'DependsOn' => all_dependencies,
        }
      }
    ensure
      Thread.current[:skywriter_as_json_context] = nil
    end

    def to_json(*)
      as_json.to_json
    end

    # @param with [:ref, :logical_name] How this pointer should be 
    #   rendered in JSON.  Use `:ref` to generate {"Ref": "foo"},
    #   and `:logical_name` to generate "foo"
    def as_pointer(options = {})
      with = options[:with] || :ref
      case with
      when :ref
        Skywriter::Resource::RefPointer.new(self)
      when :logical_name
        Skywriter::Resource::LogicalNamePointer.new(self)
      else
        raise ArgumentError, "Unrecognized 'with' value '#{with}'"
      end
    end

    def register_dependency(dependency)
      magical_dependencies << dependency.logical_name
    end

    private

    attr_reader :options

    def self.included(base)
      base.extend(DSL)
    end

    def all_dependencies
      (additional_dependencies + magical_dependencies).to_a
    end

    def additional_dependencies
      Set.new(Array(options[:additional_dependencies]))
    end

    def magical_dependencies
      @magical_dependencies ||= Set.new
    end

    def properties
      @properties ||= property_definitions.each_with_object({}) do |property_definition, hash|
        if (value = property_value(property_definition))
          hash[property_definition.name] = value
        end
      end
    end

    def property_value(property_definition)
      options[property_definition.key.to_s] ||
        options[property_definition.key.to_s] ||
        options[property_definition.name.to_s] ||
        options[property_definition.name.to_sym]
    end

    def property_definitions
      self.class.property_definitions
    end
  end
end
