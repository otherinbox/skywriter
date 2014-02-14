module Skywriter
  module Resource
    module EC2
      # AWS::EC2::VPCGatewayAttachment Resource
      #
      class VPCGatewayAttachment
        include Skywriter::Resource

        property :InternetGatewayId
        property :VpcId
        property :VpnGatewayId
      end
    end
  end
end
