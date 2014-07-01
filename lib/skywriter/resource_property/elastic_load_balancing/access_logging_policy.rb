module Skywriter
  class ResourceProperty
    module ElasticLoadBalancing
      class AccessLoggingPolicy < Skywriter::ResourceProperty
        property :EmitInterval
        property :Enabled
        property :S3BucketName
        property :S3BucketPrefix
      end
    end
  end
end
