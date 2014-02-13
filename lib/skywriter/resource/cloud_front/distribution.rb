module Skywriter
  class Resource
    module CloudFront
      class Distribution < Skywriter::Resource
        property :DistributionConfig
      end
    end
  end
end
