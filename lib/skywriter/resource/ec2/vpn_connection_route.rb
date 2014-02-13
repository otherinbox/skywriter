module Skywriter
  module Resource
    module EC2
      class VPNConnectionRoute
        include Skywriter::Resource

        property :DestinationCidrBlock
        property :VpnConnectionId
      end
    end
  end
end
