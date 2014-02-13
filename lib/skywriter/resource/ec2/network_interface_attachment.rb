module Skywriter
  class Resource
    module EC2
      class NetworkInterfaceAttachment < Skywriter::Resource
        property :DeleteOnTermination
        property :DeviceIndex
        property :InstanceId
        property :NetworkInterfaceId
      end
    end
  end
end
