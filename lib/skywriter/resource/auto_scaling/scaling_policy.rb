module Skywriter
  class Resource
    module AutoScaling
      class ScalingPolicy < Skywriter::Resource
        property :AdjustmentType
        property :AutoScalingGroupName
        property :Cooldown
        property :ScalingAdjustment
      end
    end
  end
end
