module Skywriter
  module Resource
    module SNS
      # AWS::SNS::TopicPolicy Resource
      # 
      class TopicPolicy
        include Skywriter::Resource

        property :PolicyDocument
        property :Topics
      end
    end
  end
end

