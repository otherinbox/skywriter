module Skywriter
  class ResourceProperty
    module EC2
      class NetworkInterface < Skywriter::ResourceProperty
        property :AssociatePublicIpAddress
        property :DeleteOnTermination
        property :Description
        property :DeviceIndex
        property :GroupSet
        property :NetworkInterfaceId
        property :PrivateIpAddress
        property :PrivateIpAddresses
        property :SecondaryPrivateIpAddressCount
        property :SubnetId
      end

      NetworkInterfaceEmbeddedPropertyType = NetworkInterface
    end
  end
end
