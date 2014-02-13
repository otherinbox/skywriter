module Skywriter
  class ResourceProperty
    module CloudFront
      class S3Origin < Skywriter::ResourceProperty
        property :OriginAccessIdentity
      end

      S3OriginType = S3Origin
    end
  end
end
