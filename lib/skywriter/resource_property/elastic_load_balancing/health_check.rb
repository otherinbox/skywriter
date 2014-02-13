module Skywriter
  class ResourceProperty
    module ElasticLoadBalancing
      class HealthCheck < Skywriter::ResourceProperty
        property :HealthyThreshold
        property :Interval
        property :Target
        property :Timeout
        property :UnhealthyThreshold
      end

      HealthCheckType = HealthCheck
    end
  end
end
