module Skywriter
  class Resource
    module EC2
      class VPCDHCPOptionsAssociation < Skywriter::Resource
        property :DhcpOptionsId
        property :VpcId
      end
    end
  end
end
