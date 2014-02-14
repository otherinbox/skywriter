module Skywriter
  class ResourceProperty
    # Declare a ResourceProperty property
    #
    # @param name [Symbol] The property name as it exists in the AWS documentation
    def self.property(name)
      property_definitions << PropertyDefinition.new(name)
    end

    # @param [Hash] options Options hash.  Valid values depend on the implementing class - see the AWS documentation
    #   at http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-product-property-reference.html
    #   for details
    def initialize(**options)
      @options = options.freeze
    end

    # Returns a JSON-able hash representing the Resource
    #
    # @return [Hash] A JSON-able hash
    #
    def as_json
      @as_json ||= property_definitions.each_with_object({}) do |property_definition, hash|
        if (value = options[property_definition.key])
          hash[property_definition.name] = value
        end
      end
    end

    private

    attr_reader :options

    def self.property_definitions
      @property_definitions ||= []
    end

    def property_definitions
      self.class.property_definitions
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
