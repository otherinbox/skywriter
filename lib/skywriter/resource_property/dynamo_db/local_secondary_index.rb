module Skywriter
  class ResourceProperty
    module DynamoDB
      class LocalSecondaryIndex < Skywriter::ResourceProperty
        property :IndexName
        property :KeySchema
        property :Projection
      end

      LocalSecondaryIndexes = LocalSecondaryIndex
    end
  end
end
