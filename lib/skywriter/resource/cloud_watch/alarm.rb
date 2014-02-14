module Skywriter
  module Resource
    module CloudWatch
      # AWS::CloudWatch::Alarm Resource
      #
      class Alarm
        include Skywriter::Resource

        property :ActionsEnabled
        property :AlarmActions
        property :AlarmDescription
        property :AlarmName
        property :ComparisonOperator
        property :Dimensions
        property :EvaluationPeriods
        property :InsufficientDataActions
        property :MetricName
        property :Namespace
        property :OKActions
        property :Period
        property :Statistic
        property :Threshold
        property :Unit
      end
    end
  end
end
