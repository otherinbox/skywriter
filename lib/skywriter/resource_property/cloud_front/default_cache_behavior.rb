module Skywriter
  class ResourceProperty
    module CloudFront
      class DefaultCacheBehavior < Skywriter::ResourceProperty
        property :TargetOriginId
        property :ForwardedValues
        property :TrustedSigners
        property :ViewerProtocolPolicy
        property :MinTTL
      end
    end
  end
end
