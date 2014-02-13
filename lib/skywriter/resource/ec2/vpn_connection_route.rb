module Skywriter
  class Resource
    module EC2
      class VPNConnectionRoute < Skywriter::Resource
        property :DestinationCidrBlock
        property :VpnConnectionId
      end
    end
  end
end
