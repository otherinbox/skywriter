module Skywriter
  module Resource
    module AutoScaling
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
