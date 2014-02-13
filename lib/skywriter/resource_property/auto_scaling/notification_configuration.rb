module Skywriter
  class ResourceProperty
    module AutoScaling
      class NotificationConfiguration < Skywriter::ResourceProperty
        property :TopicARN
        property :NotificationTypes
      end
    end
  end
end

