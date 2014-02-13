module Skywriter
  class Resource
    module S3
      class BucketPolicy < Skywriter::Resource
        property :Bucket
        property :PolicyDocument
      end
    end
  end
end

