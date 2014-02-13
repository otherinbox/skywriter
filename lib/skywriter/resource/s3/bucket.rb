module Skywriter
  class Resource
    module S3
      class Bucket < Skywriter::Resource
        property :AccessControl
        property :BucketName
        property :Tags
        property :WebsiteConfiguration
      end
    end
  end
end

