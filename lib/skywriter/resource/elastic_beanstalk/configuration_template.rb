module Skywriter
  module Resource
    module ElasticBeanstalk
      class ConfigurationTemplate
        include Skywriter::Resource

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
