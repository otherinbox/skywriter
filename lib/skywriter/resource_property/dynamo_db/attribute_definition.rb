module Skywriter
  class ResourceProperty
    module DynamoDB
      class AttributeDefinition < Skywriter::ResourceProperty
        property :AttributeName
        property :AttributeType
      end
    end
  end
end
