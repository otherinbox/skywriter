module Skywriter
  class ResourceProperty
    module EC2
      class NetworkInterfaceGroupItem < Skywriter::ResourceProperty
        property :GroupId
        property :GroupName
      end
    end
  end
end
