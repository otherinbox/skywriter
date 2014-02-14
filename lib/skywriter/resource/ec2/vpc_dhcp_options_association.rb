module Skywriter
  module Resource
    module EC2
      # AWS::EC2::VPCDHCPOptionsAssociation Resource
      # 
      class VPCDHCPOptionsAssociation
        include Skywriter::Resource

        property :DhcpOptionsId
        property :VpcId
      end
    end
  end
end
