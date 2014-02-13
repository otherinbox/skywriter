module Skywriter
  module Resource
    module SQS
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

