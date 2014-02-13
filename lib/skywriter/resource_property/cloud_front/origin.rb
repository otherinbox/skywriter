module Skywriter
  class ResourceProperty
    module CloudFront
      class Origin < Skywriter::ResourceProperty
        property :DomainName
        property :Id
        property :S3OriginConfig
        property :CustomOriginConfig
      end

      OriginType = Origin
    end
  end
end
