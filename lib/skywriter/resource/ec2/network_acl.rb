module Skywriter
  class Resource
    module EC2
      class NetworkAcl < Skywriter::Resource
        property :Tags
        property :VpcId
      end
    end
  end
end
