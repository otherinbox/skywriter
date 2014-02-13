module Skywriter
  module Resource
    module EC2
      class EIPAssociation
        include Skywriter::Resource

        property :AllocationId
        property :EIP
        property :InstanceId
        property :NetworkInterfaceId
        property :PrivateIpAddress
      end
    end
  end
end
