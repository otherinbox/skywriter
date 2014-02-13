module Skywriter
  class ResourceProperty
    module CloudFront
     class DistributionConfig < Skywriter::ResourceProperty
        property :Aliases
        property :CacheBehaviors
        property :Comment
        property :DefaultCacheBehavior
        property :DefaultRootObject
        property :Enabled
        property :Logging
        property :Origins
      end

     DistributionConfigType = DistributionConfig
    end
  end
end
