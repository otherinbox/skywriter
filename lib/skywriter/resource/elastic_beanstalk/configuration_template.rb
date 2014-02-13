module Skywriter
  class Resource
    module ElasticBeanstalk
      class ConfigurationTemplate < Skywriter::Resource
        property :ApplicationName
        property :Description
        property :EnvironmentId
        property :OptionsSettings
        property :SolutionStackName
        property :SourceConfiguration
      end
    end
  end
end
