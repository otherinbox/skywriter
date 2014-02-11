module SkyWriter
  class ResourceProperty
    def self.property(name, **options)
      property_definitions << PropertyDefinition.new(name, options)
    end

    def initialize(**options)
      @properties = options.freeze
    end

    def as_json
      @as_json ||= property_definitions.each_with_object({}) do |property_definition, hash|
        if (value = @properties[property_definition.key])
          hash[property_definition.name] = value.send(property_definition.convert)
        end
      end
    end

    private

    def self.property_definitions
      @property_definitions ||= []
    end

    def property_definitions
      self.class.property_definitions
    end
  end

  class PropertyDefinition
    attr_reader :name, :key, :convert

    def initialize(name, **options)
      @name = name
      @key = name.to_s.underscore.to_sym
      @convert = options[:convert] || :to_s
    end
  end
end
