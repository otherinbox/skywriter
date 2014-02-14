module Skywriter
  module Resource
    module CloudFront
      # AWS::CloudFront::Distribution Resource
      #
      class Distribution
        include Skywriter::Resource

        property :DistributionConfig
      end
    end
  end
end
