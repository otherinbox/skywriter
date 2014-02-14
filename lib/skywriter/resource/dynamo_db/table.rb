module Skywriter
  module Resource
    module DynamoDB
      # AWS::DynamoDB::Table Resource
      #
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
