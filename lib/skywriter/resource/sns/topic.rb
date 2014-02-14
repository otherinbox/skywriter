module Skywriter
  module Resource
    module SNS
      # AWS::SNS::Topic Resource
      # 
      class Topic
        include Skywriter::Resource

        property :DisplayName
        property :Subscription
        property :TopicName
      end
    end
  end
end

