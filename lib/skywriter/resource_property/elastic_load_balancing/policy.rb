module Skywriter
  class ResourceProperty
    module ElasticLoadBalancing
      class Policy < Skywriter::ResourceProperty
        property :Attributes
        property :InstancePorts
        property :LoadBalancerPorts
        property :PolicyName
        property :PolicyType
      end
    end
  end
end
