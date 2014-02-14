module Skywriter
  module Resource
    module EC2
      # AWS::EC2::VPNConnection Resource
      #
      class VPNConnection
        include Skywriter::Resource

        property :Type
        property :CustomerGatewayId
        property :StaticRoutesOnly
        property :Tags
        property :VpnGatewayId
      end
    end
  end
end
