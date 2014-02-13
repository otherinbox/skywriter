module Skywriter
  module Resource
    module EC2
      class VPNGateway
        include Skywriter::Resource

        property :Type
        property :Tags
      end
    end
  end
end
