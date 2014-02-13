module Skywriter
  class Resource
    module AutoScaling
      class ScheduledAction < Skywriter::Resource
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
