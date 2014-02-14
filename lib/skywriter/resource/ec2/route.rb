module Skywriter
  module Resource
    module EC2
      # AWS::EC2::Route Resource
      #
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
