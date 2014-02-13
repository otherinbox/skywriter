module Skywriter
  class ResourceProperty
    module ElasticBeanstalk
      class SourceConfiguration < Skywriter::ResourceProperty
        property :ApplicationName
        property :TemplateName
      end
    end
  end
end
