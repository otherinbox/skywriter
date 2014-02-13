module Skywriter
  class Resource
    module EC2
      class VPCGatewayAttachment < Skywriter::Resource
        property :InternetGatewayId
        property :VpcId
        property :VpnGatewayId
      end
    end
  end
end
