module Skywriter
  module Resource
    module ElasticBeanstalk
      # AWS::ElasticBeanstalk::ApplicationVersion Resource
      # 
      class ApplicationVersion
        include Skywriter::Resource

        property :ApplicationName
        property :Description
        property :SourceBundle
      end
    end
  end
end
