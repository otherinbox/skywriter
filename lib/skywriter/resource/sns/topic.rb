module Skywriter
  class Resource
    module SNS
      class Topic < Skywriter::Resource
        property :DisplayName
        property :Subscription
        property :TopicName
      end
    end
  end
end

