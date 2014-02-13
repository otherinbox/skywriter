module Skywriter
  module Resource
    module EC2
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
