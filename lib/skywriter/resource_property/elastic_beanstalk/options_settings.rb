module Skywriter
  class ResourceProperty
    module ElasticBeanstalk
      class OptionSettings < Skywriter::ResourceProperty
        property :Namespace
        property :OptionName
        property :Value
      end
    end
  end
end
