module Skywriter
  class Resource
    module AutoScaling
      class AutoScalingGroup < Skywriter::Resource
        property :AvailabilityZones
        property :Cooldown
        property :DesiredCapacity
        property :HealthCheckGracePeriod
        property :HealthCheckType
        property :InstanceId
        property :LaunchConfigurationName
        property :LoadBalancerNames
        property :MaxSize
        property :MinSize
        property :NotificationConfiguration
        property :Tags
        property :TerminationPolicies
        property :VPCZoneIdentifier
      end
    end
  end
end
