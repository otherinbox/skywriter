module Skywriter
  module Resource
    module EC2
      # AWS::EC2::VPNGatewayRoutePropagation Resource
      # 
      class VPNGatewayRoutePropagation
        include Skywriter::Resource

        property :RouteTableIds
        property :VpnGatewayId
      end
    end
  end
end
