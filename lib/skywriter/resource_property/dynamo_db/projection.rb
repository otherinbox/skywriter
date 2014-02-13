module Skywriter
  class ResourceProperty
    module DynamoDB
      class Projection < Skywriter::ResourceProperty
        property :NonKeyAttributes
        property :ProjectionType
      end
    end
  end
end
