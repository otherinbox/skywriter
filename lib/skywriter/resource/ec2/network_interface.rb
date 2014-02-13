module Skywriter
  class Resource
    module EC2
      class NetworkInterface < Skywriter::Resource
        property :Description
        property :GroupSet
        property :PrivateIpAddress
        property :PrivateIpAddresses
        property :SecondaryPrivateIpAddressCount
        property :SourceDestCheck
        property :SubnetId
        property :Tags
      end
    end
  end
end
