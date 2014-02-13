module Skywriter
  class Resource
    module EC2
      class VPNConnection < Skywriter::Resource
        property :Type
        property :CustomerGatewayId
        property :StaticRoutesOnly
        property :Tags
        property :VpnGatewayId
      end
    end
  end
end
