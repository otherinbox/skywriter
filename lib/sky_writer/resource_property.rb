module SkyWriter
  class ResourceProperty
    def self.property(name, **options)
      property_definition = PropertyDefinition.new(name, options)

      property_definitions << property_definition

      # Define property accessor method (#foo)
      define_method(property_definition.key) do 
        property_value(property_definition)
      end

      # Define property json method (#foo_as_json)
      define_method("#{property_definition.key}_as_json") do
        property_as_json(property_definition)
      end
    end

    def initialize(**options)
      @properties = options.freeze
    end

    def as_json
      @as_json ||= property_definitions.each_with_object({}) do |property_definition, hash|
        if (value = property_as_json(property_definition))
          hash[property_definition.name] = value
        end
      end
    end

    private

    def self.property_definitions
      @property_definitions ||= []
    end

    def property_value(property_definition)
      @properties[property_definition.key]
    end

    def property_as_json(property_definition)
      if (value = property_value(property_definition)) && (!value.kind_of?(Enumerable) || !value.empty?)
        value.send(property_definition.convert)
      end
    end

    def property_definitions
      self.class.property_definitions
    end
  end

  class PropertyDefinition
    attr_reader :name, :key, :convert

    def initialize(name, **options)
      @name = name.to_s
      @key = name.to_s.underscore.to_sym
      @convert = options[:convert] || :to_s
    end
  end
end
