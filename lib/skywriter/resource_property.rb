module Skywriter
  class ResourceProperty
    def self.property(name, options = {})
      property_definitions << PropertyDefinition.new(name, options)
    end

    def initialize(options = {})
      @properties = options.freeze
    end

    def as_json
      @as_json ||= property_definitions.each_with_object({}) do |property_definition, hash|
        if (value = property_value(property_definition))
          hash[property_definition.name] = value
        end
      end
    end

    private

    attr_reader :properties

    def self.property_definitions
      @property_definitions ||= []
    end

    def property_value(property_definition)
      properties[property_definition.key] ||
        properties[property_definition.name.to_sym] ||
        properties[property_definition.key.to_s] ||
        properties[property_definition.name]
    end

    def property_definitions
      self.class.property_definitions
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
