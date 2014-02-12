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
          case property_definition.type
          when :string
            hash[property_definition.name] = value.to_s
          when :array
            hash[property_definition.name] = Array(value)
          when :integer
            hash[property_definition.name] = value.to_i
          when :float, :numeric
            hash[property_definition.name] = value.to_f
          end
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
    attr_reader :name, :key, :type

    def initialize(name, **options)
      @name = name.to_s
      @key = name.to_s.underscore.to_sym
      @type = options[:type] || :string
    end
  end
end
