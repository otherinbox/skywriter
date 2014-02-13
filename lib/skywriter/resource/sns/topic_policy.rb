module Skywriter
  class Resource
    module SNS
      class TopicPolicy < Skywriter::Resource
        property :PolicyDocument
        property :Topics
      end
    end
  end
end

