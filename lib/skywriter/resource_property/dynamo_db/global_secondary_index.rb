module Skywriter
  class ResourceProperty
    module DynamoDB
      class GlobalSecondaryIndex < Skywriter::ResourceProperty
        property :IndexName
        property :KeySchema
        property :Projection
        property :ProvisionedThroughput
      end

      GlobalSecondaryIndexes = GlobalSecondaryIndex
    end
  end
end
