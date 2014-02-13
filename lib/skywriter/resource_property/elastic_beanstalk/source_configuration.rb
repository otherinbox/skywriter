module Skywriter
  class ResourceProperty
    module ElasticBeanstalk
      class SourceConfiguration < Skywriter::ResourceProperty
        property :ApplicationName
        property :TemplateName
      end

      SourceConfigurationPropertyType = SourceConfiguration
    end

    AWSElasticBeanstalkSourceConfigurationPropertyType = ElasticBeanstalk::SourceConfiguration
    AWSElasticBeanstalkSourceConfiguration = ElasticBeanstalk::SourceConfiguration
  end
end
