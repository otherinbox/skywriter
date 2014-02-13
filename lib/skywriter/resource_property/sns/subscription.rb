module Skywriter
  class ResourceProperty
    module SNS
      class Subscription < Skywriter::ResourceProperty
        property :Endpoint
        property :Protocol
      end
    end
  end
end
