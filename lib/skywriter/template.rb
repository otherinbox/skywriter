module Skywriter
  # CloudFormation Template
  #
  # Represents a CloudFormation template.
  #
  # @example
  #   parameters = {"foo" => "bar"}
  #   webserver = Skywriter::Resource::EC2::Instance.new('MyWebserver')
  #   load_balancer = Skywriter::Resource::ElasticLoadBalancing::LoadBalancer.new('MyLoadBalancer')
  #
  #   template = Skywriter::Template.new(
  #     description: "My Template",
  #     parameters: parameters,
  #     resources: [webserver, load_balancer]
  #   )
  #
  #   AWS::CloudFormation.new.stacks.create('my-stack', template.to_json)
  #
  class Template
    class MergeError < StandardError; end

    attr_reader :format_version, :description
    attr_reader :parameters, :mappings, :conditions, :resources, :outputs

    # Constructor
    #
    # See the AWS Documentation for details on the meaning of these parameters:
    # http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/concept-template.html
    #
    # @param format_version [String] The AWS CloudFormation template version
    # @param description [String] The stack description
    # @param parameters [Hash] A hash of parameters
    # @param mappings [Hash] A hash of mappings
    # @param conditions [Hash] A hash of condition
    # @param resources [Hash, Array<Skywriter::Resource>] Either a hash of
    #   resources or an array of objects whose classwhich include 
    #   Skywriter::Resource, for example Skywriter::Resource::EC2::Instance.
    # @param outputs [Hash] A hash of outputs
    def initialize(options = {})
      @format_version   = (options[:format_version] || '2010-09-09').freeze
      @description      = options[:description].freeze

      @parameters       = (access_liberally(options, :parameters) || {}).freeze
      @mappings         = (access_liberally(options, :mappings) || {}).freeze
      @conditions       = (access_liberally(options, :conditions) || {}).freeze
      @resources        = resources_as_json(access_liberally(options, :resources)).freeze
      @outputs          = (access_liberally(options, :outputs) || {}).freeze
    end

    # Returns a JSON string representing the Resource
    #
    def to_json(*)
      as_json.to_json
    end

    # Returns a hash representing the Template
    #
    # @return [Hash] A JSON-able hash
    #
    def as_json(*)
      {
        'FormatVersion' => format_version,
        'Description'   => description,
        'Parameters'    => parameters,
        'Mappings'      => mappings,
        'Conditions'    => conditions,
        'Resources'     => resources,
        'Outputs'       => outputs,

      }.reject { |key, value| value.nil? }
    end

    def merge(other)
      dup.merge!(other)
    end

    protected

    def merge!(other)
      raise ArgumentError, "Don't know how to merge with a #{other.class.name}" unless other.kind_of?(Template)

      merge_value!(:format_version, other.format_version)
      merge_value!(:description, other.description)

      merge_hash!(:parameters, other.parameters)
      merge_hash!(:mappings, other.mappings)
      merge_hash!(:conditions, other.conditions)
      merge_hash!(:resources, other.resources)
      merge_hash!(:outputs, other.outputs)

      self
    end

    private

    def access_liberally(object, key)
      object[key.to_sym] ||
        object[key.to_s] ||
        object[key.to_s.camelcase.to_sym] ||
        object[key.to_s.camelcase.to_s]
    end

    def merge_value!(attribute, other_value)
      self_value = send(attribute)

      raise MergeError, "Duplicate attribute '#{attribute}' found" if self_value && (self_value != other_value)

      instance_variable_set("@#{attribute}", other_value)
    end

    def merge_hash!(attribute, other_value)
      self_value = send(attribute)

      new_hash = self_value.merge(other_value) do |key, old, new|
        raise MergeError, "Duplicate key '#{key}' found with different value in attribute '#{attribute}'" if old != new
        old
      end.freeze

      instance_variable_set("@#{attribute}", new_hash)
    end

    def resources_as_json(resources_option = nil)
      case resources_option
      when Array
        merge_disjoint_keys_and_duplicated_values(resources_option.map(&:as_json))
      when Hash
        resources_option.as_json
      else
        {}
      end
    end

    def merge_disjoint_keys_and_duplicated_values(hashes)
      hashes.reduce({}) do |memo, hash|
        memo.merge(hash) do |key, old, new|
          raise MergeError, "Duplicate key '#{key}' has different values" unless old == new
          old
        end
      end
    end
  end
end
