module Skywriter
  module Resource
    module EC2
      class Route
        include Skywriter::Resource

        property :DestinationCidrBlock
        property :GatewayId
        property :InstanceId
        property :NetworkInterfaceId
        property :RouteTableId
      end
    end
  end
end
