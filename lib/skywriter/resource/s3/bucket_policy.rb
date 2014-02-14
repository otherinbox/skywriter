module Skywriter
  module Resource
    module S3
      # AWS::S3::BucketPolicy Resource
      # 
      class BucketPolicy
        include Skywriter::Resource

        property :Bucket
        property :PolicyDocument
      end
    end
  end
end

