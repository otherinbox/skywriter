module Skywriter
  class ResourceProperty
    module ElasticLoadBalancing
      class ConnectionDrainingPolicy < Skywriter::ResourceProperty
        property :Enabled
        property :Timeout
      end
    end
  end
end
