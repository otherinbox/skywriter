module Skywriter
  module Resource
    module EC2
      # AWS::EC2::CustomerGateway Resource
      #
      class CustomerGateway
        include Skywriter::Resource

        property :BgpAsn
        property :IpAddress
        property :Tags
        property :Type
      end
    end
  end
end
