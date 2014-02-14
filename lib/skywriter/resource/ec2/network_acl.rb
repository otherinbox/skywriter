module Skywriter
  module Resource
    module EC2
      # AWS::EC2::NetworkAcl Resource
      #
      class NetworkAcl
        include Skywriter::Resource

        property :Tags
        property :VpcId
      end
    end
  end
end
