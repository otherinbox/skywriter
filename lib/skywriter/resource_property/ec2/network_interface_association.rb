module Skywriter
  class ResourceProperty
    module EC2
      class NetworkInterfaceAssociation < Skywriter::ResourceProperty
        property :AttachmentID
        property :InstanceID
        property :PublicIp
        property :IpOwnerId
      end
    end
  end
end
