module Skywriter
  module Resource
    module AutoScaling
      # AWS::AutoScaling::Trigger Resource
      #
      # http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-trigger.html
      #
      class Trigger
        include Skywriter::Resource

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
