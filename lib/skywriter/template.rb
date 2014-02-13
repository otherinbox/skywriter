module Skywriter
  class Template
    class ConversionError < StandardError; end

    attr_reader :format_version, :description, :resources

    def initialize(options = {})
      @format_version   = options[:format_version].freeze
      @description      = options[:description].freeze
      @resources        = (options[:resources] || []).freeze
    end

    def as_json
      {
        'FormatVersion' => format_version,
        'Description' => description,
        'Parameters' => {},
        'Mappings' => {},
        'Conditions' => {},
        'Resources' => resources_as_json,
        'Outputs' => {},
      }.reject { |key, value| value.nil? }
    end

    private

    def resources_as_json
      merge_disjoint_keys_and_duplicated_values(resources.map(&:as_json))
    end

    def merge_disjoint_keys_and_duplicated_values(hashes)
      hashes.reduce({}) do |memo, hash|
        memo.merge(hash) do |key, old, new|
          raise ConversionError, "Duplicate key '#{key}' has different values" unless old == new
          old
        end
      end
    end
  end
end
