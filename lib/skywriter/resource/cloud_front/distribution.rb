module Skywriter
  module Resource
    module CloudFront
      class Distribution
        include Skywriter::Resource

        property :DistributionConfig
      end
    end
  end
end
