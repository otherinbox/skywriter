module Skywriter
  module Resource
    module ElasticLoadBalancing
      # AWS::ElasticLoadBalancing::LoadBalancer Resource
      # 
      class LoadBalancer
        include Skywriter::Resource

        property :AppCookieStickinessPolicy
        property :AvailabilityZones
        property :CrossZone
        property :HealthCheck
        property :Instances
        property :LBCookieStickinessPolicy
        property :LoadBalancerNames
        property :Listeners
        property :Policies
        property :Scheme
        property :SecurityGroups
        property :Subnets
      end
    end
  end
end

