module Skywriter
  class ResourceProperty
    module ElasticBeanstalk
      class EnvironmentTier < Skywriter::ResourceProperty
        property :Name
        property :Type
        property :Version
      end
    end
  end
end
