module Skywriter
  module Resource
    module ElasticBeanstalk
      class Application
        include Skywriter::Resource

        property :ApplicationName
        property :Description
      end
    end
  end
end
