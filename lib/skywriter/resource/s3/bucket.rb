module Skywriter
  module Resource
    module S3
      # AWS::S3::Bucket Resource
      # 
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

