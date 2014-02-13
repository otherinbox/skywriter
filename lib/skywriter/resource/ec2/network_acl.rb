module Skywriter
  module Resource
    module EC2
      class NetworkAcl
        include Skywriter::Resource

        property :Tags
        property :VpcId
      end
    end
  end
end
