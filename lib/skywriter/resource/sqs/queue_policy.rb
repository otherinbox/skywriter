module Skywriter
  module Resource
    module SQS
      # AWS::SQS::QueuePolicy Resource
      # 
      class QueuePolicy
        include Skywriter::Resource

        property :PolicyDocument
        property :Queues
      end
    end
  end
end

