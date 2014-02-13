module Skywriter
  class Resource
    module DynamoDB
      class Table < Skywriter::Resource
        property :AttributeDefinitions
        property :GlobalSecondaryIndexes
        property :KeySchema
        property :LocalSecondaryIndexes
        property :ProvisionedThroughput
        property :TableName
      end
    end
  end
end
