module Skywriter
  class ResourceProperty
    module DynamoDB
      class KeySchema < Skywriter::ResourceProperty
        property :AttributeName
        property :KeyType
      end
    end
  end
end
