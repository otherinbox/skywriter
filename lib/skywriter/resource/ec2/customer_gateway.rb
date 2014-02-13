module Skywriter
  class Resource
    module EC2
      class CustomerGateway < Skywriter::Resource
        property :BgpAsn
        property :IpAddress
        property :Tags
        property :Type
      end
    end
  end
end
