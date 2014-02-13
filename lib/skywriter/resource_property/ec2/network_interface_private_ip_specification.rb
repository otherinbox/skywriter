module Skywriter
  class ResourceProperty
    module EC2
      class NetworkInterfacePrivateIPSpecification < Skywriter::ResourceProperty
        property :PrivateIpAddress
        property :Primary
      end
    end
  end
end
