module Skywriter
  class ResourceProperty
    module EC2
      class NetworkInterfaceAttachment < Skywriter::ResourceProperty
        property :AttachmentID
        property :InstanceID
      end
    end
  end
end
