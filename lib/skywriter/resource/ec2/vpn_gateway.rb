module Skywriter
  module Resource
    module EC2
      # AWS::EC2::VPNGateway Resource
      # 
      class VPNGateway
        include Skywriter::Resource

        property :Type
        property :Tags
      end
    end
  end
end
