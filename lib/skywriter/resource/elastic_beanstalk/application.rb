module Skywriter
  class Resource
    module ElasticBeanstalk
      class Application < Skywriter::Resource
        property :ApplicationName
        property :Description
      end
    end
  end
end
