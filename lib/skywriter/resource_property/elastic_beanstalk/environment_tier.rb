module Skywriter
  class ResourceProperty
    module ElasticBeanstalk
      class EnvironmentTier < Skywriter::ResourceProperty
        property :Name
        property :Type
        property :Version
      end

      EnvironmentTierPropertyType = EnvironmentTier
    end

    AWSElasticBeanstalkEnvironmentTierPropertyType = ElasticBeanstalk::EnvironmentTier
    AWSElasticBeanstalkEnvironmentTier = ElasticBeanstalk::EnvironmentTier
  end
end
