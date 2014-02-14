module Skywriter
  module Resource
    module CloudFormation
      # AWS::CloudFormation::Authentication Resource
      #
      class Authentication
        include Skywriter::Resource

        property :accessKeyId
        property :buckets
        property :password
        property :secretKey
        property :type
        property :uris
        property :username
        property :roleName

        def as_json
          Thread.current[:skywriter_as_json_context] = self

          as_json = { logical_name => { 'Type' => type } }

          options.each do |top_level_key, properties|
            as_json[logical_name][top_level_key.to_s] = properties(properties).as_json
          end

          as_json[logical_name]['DependsOn'] = all_dependencies

          return as_json
        ensure
          Thread.current[:skywriter_as_json_context] = nil
        end

        private

        def properties(properties)
          property_definitions.each_with_object({}) do |property_definition, hash|
            if (value = properties[property_definition.key])
              hash[property_definition.name] = value
            end
          end
        end
      end
    end
  end
end
