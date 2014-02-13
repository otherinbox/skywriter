module Skywriter
  class Resource
    module AutoScaling
      class Trigger < Skywriter::Resource
        property :AutoScalingGroupName
        property :BreachDuration
        property :Dimensions
        property :LowerBreachScaleIncrement
        property :LowerThreshold
        property :MetricName
        property :Namespace
        property :Period
        property :Statistic
        property :Unit
        property :UpperBreachScaleIncrement
        property :UpperThreshold
      end
    end
  end
end
