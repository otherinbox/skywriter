module Skywriter
  module Resource
    module AutoScaling
      # AWS::AutoScaling::ScalingPolicy Resource
      #
      # http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html
      #
      class ScalingPolicy
        include Skywriter::Resource

        property :AdjustmentType
        property :AutoScalingGroupName
        property :Cooldown
        property :ScalingAdjustment
      end
    end
  end
end
