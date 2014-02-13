module Skywriter
  class Resource
    module EC2
      class Route < Skywriter::Resource
        property :DestinationCidrBlock
        property :GatewayId
        property :InstanceId
        property :NetworkInterfaceId
        property :RouteTableId
      end
    end
  end
end
