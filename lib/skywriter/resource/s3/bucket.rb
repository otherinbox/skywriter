module Skywriter
  module Resource
    module S3
      class Bucket
        include Skywriter::Resource

        property :AccessControl
        property :BucketName
        property :Tags
        property :WebsiteConfiguration
      end
    end
  end
end

