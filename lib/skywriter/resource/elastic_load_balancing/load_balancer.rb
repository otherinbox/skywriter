module Skywriter
  class Resource
    module ElasticLoadBalancing
      class LoadBalancer < Skywriter::Resource
        property :AppCookieStickinessPolicy
        property :AvailabilityZones
        property :CrossZone
        property :HealthCheck
        property :Instances
        property :LBCookieStickinessPolicy
        property :LoadBalancerName
        property :Listeners
        property :Policies
        property :Scheme
        property :SecurityGroups
        property :Subnets
      end
    end
  end
end

