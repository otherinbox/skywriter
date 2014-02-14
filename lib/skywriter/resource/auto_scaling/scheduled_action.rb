module Skywriter
  module Resource
    module AutoScaling
      # AWS::AutoScaling::ScheduledAction Resource
      #
      # http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-as-scheduledaction.html
      #
      class ScheduledAction
        include Skywriter::Resource

        property :AutoScalingGroupName
        property :DesiredCapacity
        property :EndTime
        property :MaxSize
        property :MinSize
        property :Recurrence
        property :StartTime
      end
    end
  end
end
