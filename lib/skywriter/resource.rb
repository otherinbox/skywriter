module Skywriter
  module Resource
    module DSL
      # Declare a Resource property
      #
      # @param name [Symbol] The property name as it exists in the AWS documentation
      def property(name)
        property_definitions << PropertyDefinition.new(name)
      end

      # A list of PropertyDefinition instances defined for this Resource
      #
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

        def initialize(name)
          @name = name.to_s
          @key = name.to_s.underscore.to_sym
        end
      end
    end

    attr_reader :logical_name

    # @param [String] logical_name The logical name of this Resource.  Will be used as the hash key in the 'Resources' hash
    # @param [Hash] options Options hash.  Valid values depend on the implementing class - see the AWS documentation
    #   at http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html
    #   for details
    #
    def initialize(logical_name, options = {})
      @logical_name = logical_name

      @additional_dependencies = Set.new(Array(options.delete(:additional_dependencies)))
      @deletion_policy = options.delete(:deletion_policy)
      @metadata = options.delete(:metadata)
      @update_policy = options.delete(:update_policy)

      @options = options.freeze
    end

    # Returns a hash representing the Resource
    #
    # @return [Hash] A JSON-able hash
    #
    def as_json
      Thread.current[:skywriter_as_json_context] = self

      { logical_name =>
        {
          'Type' => type,
          'Properties' => properties.as_json,
          'DependsOn' => all_dependencies,
          'Metadata' => metadata,
          'DeletionPolicy' => deletion_policy,
          'UpdatePolicy' => update_policy,
        }.reject { |key, value| value.nil? }
      }
    ensure
      Thread.current[:skywriter_as_json_context] = nil
    end

    # Returns a JSON string representing the Resource
    #
    def to_json(*)
      as_json.to_json
    end

    # Returns a pointer to this Resource
    #
    # Pointers represent references to resources defined elsewhere in
    # a template.  In most cases pointers serialize to something like
    #
    # @example
    #   { "Ref" => "logical_name" }
    #
    # In some cases, you might need to refer to a resource using its
    # logical name directly (as opposed to nested in a hash as shown),
    # in which case you can tell `as_pointer` to point with the resource's
    # logical name:
    #
    # @example
    #   resource.as_pointer(with: :logical_name)
    #
    # @param with [:ref, :logical_name] How this pointer should be 
    #   rendered in JSON.  Use `:ref` to generate {"Ref": "foo"},
    #   and `:logical_name` to generate "foo"
    #
    # @return [Skywriter::Resource::Pointer] A pointer to this resource
    #
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

    # @api private
    #
    # @param dependency [Skywriter::Resource] A Resource upon which this resource depends.
    #
    def register_dependency(dependency)
      magical_dependencies << dependency.logical_name
    end

    private

    attr_reader :options, :additional_dependencies, :deletion_policy, :metadata,
      :update_policy

    def self.included(base)
      base.extend(DSL)
    end

    def all_dependencies
      (additional_dependencies + magical_dependencies).to_a
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
      options[property_definition.key.to_sym] ||
        options[property_definition.key.to_s] ||
        options[property_definition.name.to_sym] ||
        options[property_definition.name.to_s]
    end

    def property_definitions
      self.class.property_definitions
    end
  end
end
