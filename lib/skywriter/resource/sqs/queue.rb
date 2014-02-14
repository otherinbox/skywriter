module Skywriter
  module Resource
    module SQS
      # AWS::SQS::Queue Resource
      # 
      class Queue
        include Skywriter::Resource

        property :DelaySeconds
        property :MaximumMessageSize
        property :MessageRetentionPeriod
        property :QueueName
        property :ReceiveMessageWaitTimeSeconds
      end
    end
  end
end

