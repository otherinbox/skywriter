module Skywriter
  class ResourceProperty
    module ElasticLoadBalancing
      class AccessLoggingPolicy < Skywriter::ResourceProperty
        property :Enabled
        property :Timeout
      end
    end
  end
end
