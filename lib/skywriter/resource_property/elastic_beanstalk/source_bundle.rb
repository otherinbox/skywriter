module Skywriter
  class ResourceProperty
    module ElasticBeanstalk
      class SourceBundle < Skywriter::ResourceProperty
        property :S3Bucket
        property :S3Key
      end

      SourceBundlePropertyType = SourceBundle
    end

    AWSElasticBeanstalkSourceBundlePropertyType = ElasticBeanstalk::SourceBundle
    AWSElasticBeanstalkSourceBundle = ElasticBeanstalk::SourceBundle
  end
end
