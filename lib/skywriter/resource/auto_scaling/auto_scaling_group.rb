module Skywriter
  module Resource
    module AutoScaling
      # AWS::AutoScaling::AutoScalingGroup Resource
      #
      # http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-group.html
      #
      class AutoScalingGroup
        include Skywriter::Resource

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
