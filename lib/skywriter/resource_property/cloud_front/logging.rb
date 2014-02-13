module Skywriter
  class ResourceProperty
    module CloudFront
      class Logging < Skywriter::ResourceProperty
        property :Bucket
        property :Prefix
      end
    end
  end
end
