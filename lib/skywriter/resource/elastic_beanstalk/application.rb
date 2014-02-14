module Skywriter
  module Resource
    module ElasticBeanstalk
      # AWS::ElasticBeanstalk::Application Resource
      # 
      class Application
        include Skywriter::Resource

        property :ApplicationName
        property :Description
      end
    end
  end
end
