module Skywriter
  class ResourceProperty
    module ElasticBeanstalk
      class OptionSetting < Skywriter::ResourceProperty
        property :Namespace
        property :OptionName
        property :Value
      end

      OptionSettingsPropertyType = OptionSetting
      OptionSetting = OptionSetting
    end

    AWSElasticBeanstalkOptionSettingsPropertyType = ElasticBeanstalk::OptionSetting
    AWSElasticBeanstalkOptionSettings = ElasticBeanstalk::OptionSetting
  end
end
