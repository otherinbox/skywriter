module Skywriter
  module Resource
    module EC2
      # AWS::EC2::EIPAssociation Resource
      #
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
