module Skywriter
  class ResourceProperty
    module CloudFront
      class CustomOrigin < Skywriter::ResourceProperty
        property :HTTPPort
        property :HTTPSPort
        property :OriginProtocolPolicy
      end
    end
  end
end
