module Skywriter
  class ResourceProperty
    module ElasticBeanstalk
      class SourceBundle < Skywriter::ResourceProperty
        property :S3Bucket
        property :S3Key
      end
    end
  end
end
