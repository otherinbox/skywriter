module Skywriter
  class Resource
    module EC2
      class VPNGateway < Skywriter::Resource
        property :Type
        property :Tags
      end
    end
  end
end
