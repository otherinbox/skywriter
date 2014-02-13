module Skywriter
  module Resource
    module EC2
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
