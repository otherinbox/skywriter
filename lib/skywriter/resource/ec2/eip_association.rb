module Skywriter
  class Resource
    module EC2
      class EIPAssociation < Skywriter::Resource
        property :AllocationId
        property :EIP
        property :InstanceId
        property :NetworkInterfaceId
        property :PrivateIpAddress
      end
    end
  end
end
