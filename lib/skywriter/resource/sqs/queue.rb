module Skywriter
  class Resource
    module SQS
      class Queue < Skywriter::Resource
        property :DelaySeconds
        property :MaximumMessageSize
        property :MessageRetentionPeriod
        property :QueueName
        property :ReceiveMessageWaitTimeSeconds
      end
    end
  end
end

