module Skywriter
  class Resource
    module SQS
      class QueuePolicy < Skywriter::Resource
        property :PolicyDocument
        property :Queues
      end
    end
  end
end

