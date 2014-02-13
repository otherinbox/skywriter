module Skywriter
  module Resource
    module SQS
      class QueuePolicy
        include Skywriter::Resource

        property :PolicyDocument
        property :Queues
      end
    end
  end
end

