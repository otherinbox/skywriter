module Skywriter
  class Resource
    module EC2
      class VPNGatewayRoutePropagation < Skywriter::Resource
        property :RouteTableIds
        property :VpnGatewayId
      end
    end
  end
end
