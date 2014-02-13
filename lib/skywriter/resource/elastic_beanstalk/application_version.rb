module Skywriter
  class Resource
    module ElasticBeanstalk
      class ApplicationVersion < Skywriter::Resource
        property :ApplicationName
        property :Description
        property :SourceBundle
      end
    end
  end
end
