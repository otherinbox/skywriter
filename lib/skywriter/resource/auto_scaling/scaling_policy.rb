module Skywriter
  module Resource
    module AutoScaling
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
