module Skywriter
  module Resource
    module DynamoDB
      class Table
        include Skywriter::Resource

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
