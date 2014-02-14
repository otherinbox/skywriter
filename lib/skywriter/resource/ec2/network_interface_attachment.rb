module Skywriter
  module Resource
    module EC2
      # AWS::EC2::NetworkInterfaceAttachment Resource
      #
      class NetworkInterfaceAttachment
        include Skywriter::Resource

        property :DeleteOnTermination
        property :DeviceIndex
        property :InstanceId
        property :NetworkInterfaceId
      end
    end
  end
end
