module Skywriter
  module Resource
    module ElasticBeanstalk
      class Environment
        include Skywriter::Resource

        property :ApplicationName
        property :CNAMEPrefix
        property :Description
        property :EnvironmentName
        property :OptionSettings
        property :SolutionStackName
        property :TemplateName
        property :Tier
        property :VersionLabel
      end
    end
  end
end
