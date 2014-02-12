module SkyWriter
  class Resource
    def self.property(name, **options)
      property_definitions << PropertyDefinition.new(name, options)
    end

    def initialize(**options)
      @options = options.freeze
    end

    def as_json
      {
        'Type' => type,
        'Properties' => properties.as_json,
      }
    end

    def type
      @type ||= self.class.name.gsub("SkyWriter::Resource", "AWS")
    end

    def properties
      @properties ||= property_definitions.each_with_object({}) do |property_definition, hash|
        if (value = @options[property_definition.key])
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
      @name = name.to_s
      @key = name.to_s.underscore.to_sym
      @convert = options[:convert] || :to_s
    end
  end
end
