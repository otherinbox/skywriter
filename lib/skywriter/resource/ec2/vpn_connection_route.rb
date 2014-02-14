module Skywriter
  module Resource
    module EC2
      # AWS::EC2::VPNConnectionRoute Resource
      #
      class VPNConnectionRoute
        include Skywriter::Resource

        property :DestinationCidrBlock
        property :VpnConnectionId
      end
    end
  end
end
