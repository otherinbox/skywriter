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
      @resources        = (access_liberally(options, :resources) || {}).freeze
      @outputs          = (access_liberally(options, :outputs) || {}).freeze
    end

    # Returns a hash representing the Template
    #
    def as_json
      {
        'FormatVersion' => format_version,
        'Description'   => description,
        'Parameters'    => parameters.as_json,
        'Mappings'      => mappings.as_json,
        'Conditions'    => conditions.as_json,
        'Resources'     => resources_as_json,
        'Outputs'       => outputs.as_json,

      }.reject { |key, value| value.nil? }
    end

    private

    def access_liberally(object, key)
      object[key.to_sym] ||
        object[key.to_s] ||
        object[key.to_s.camelcase.to_sym] ||
        object[key.to_s.camelcase.to_s]
    end

    def resources_as_json
      case resources
      when Array
        merge_disjoint_keys_and_duplicated_values(resources.map(&:as_json))
      else
        resources.as_json
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
