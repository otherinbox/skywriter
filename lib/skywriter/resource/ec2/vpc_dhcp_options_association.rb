module Skywriter
  module Resource
    module EC2
      class VPCDHCPOptionsAssociation
        include Skywriter::Resource

        property :DhcpOptionsId
        property :VpcId
      end
    end
  end
end
