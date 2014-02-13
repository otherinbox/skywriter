module Skywriter
  class ResourceProperty
    module CloudFront
      class S3Origin < Skywriter::ResourceProperty
        property :OriginAccessIdentity
      end
    end
  end
end
