module SkyWriter
  class Resource
    def self.property(name, **options)
      property_definitions << PropertyDefinition.new(name, options)
    end

    attr_reader :logical_name

    def initialize(logical_name, **options)
      @logical_name = logical_name
      @options = options.freeze
    end

    def as_json
      Thread.current[:as_json_context] = self

      { logical_name =>
        {
          'Type' => type,
          'Properties' => properties.as_json,
          'DependsOn' => all_dependencies,
        }
      }
    ensure
      Thread.current[:as_json_context] = nil
    end

    def type
      @type ||= self.class.name.gsub("SkyWriter::Resource", "AWS")
    end

    # @param with [:ref, :logical_name] How this pointer should be 
    #   rendered in JSON.  Use `:ref` to generate {"Ref": "foo"},
    #   and `:logical_name` to generate "foo"
    def as_pointer(with: :ref)
      case with
      when :ref
        SkyWriter::Resource::RefPointer.new(self)
      when :logical_name
        SkyWriter::Resource::LogicalNamePointer.new(self)
      else
        raise ArgumentError, "Unrecognized 'with' value '#{with}'"
      end
    end

    def register_dependency(dependency)
      magical_dependencies << dependency.logical_name
    end

    private

    attr_reader :options

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
        if (value = options[property_definition.key])
          hash[property_definition.name] = value
        end
      end
    end

    def self.property_definitions
      @property_definitions ||= []
    end

    def property_definitions
      self.class.property_definitions
    end
  end

  class PropertyDefinition
    attr_reader :name, :key

    def initialize(name, **options)
      @name = name.to_s
      @key = name.to_s.underscore.to_sym
    end
  end
end
