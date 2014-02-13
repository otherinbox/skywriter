module Skywriter
  module Resource
    module S3
      class BucketPolicy
        include Skywriter::Resource

        property :Bucket
        property :PolicyDocument
      end
    end
  end
end

