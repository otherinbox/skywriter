module Skywriter
  class ResourceProperty
    module DynamoDB
      class ProvisionedThroughput < Skywriter::ResourceProperty
        property :ReadCapacityUnits
        property :WriteCapacityUnits
      end
    end
  end
end
