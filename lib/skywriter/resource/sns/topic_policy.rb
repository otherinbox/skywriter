module Skywriter
  module Resource
    module SNS
      class TopicPolicy
        include Skywriter::Resource

        property :PolicyDocument
        property :Topics
      end
    end
  end
end

