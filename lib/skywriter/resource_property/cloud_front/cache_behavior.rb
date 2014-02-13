module Skywriter
  class ResourceProperty
    module CloudFront
      class CacheBehavior < Skywriter::ResourceProperty
        property :TargetOriginId
        property :ForwardedValues
        property :TrustedSigners
        property :ViewerProtocolPolicy
        property :MinTTL
        property :PathPattern
      end
    end
  end
end
