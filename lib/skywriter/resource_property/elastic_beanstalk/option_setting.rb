module Skywriter
  class ResourceProperty
    module ElasticBeanstalk
      class OptionSetting < Skywriter::ResourceProperty
        property :Namespace
        property :OptionName
        property :Value
      end

      OptionSettings = OptionSetting
    end
  end
end
