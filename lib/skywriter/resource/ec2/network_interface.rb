module Skywriter
  module Resource
    module EC2
      # AWS::EC2::NetworkInterface Resource
      #
      class NetworkInterface
        include Skywriter::Resource

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
