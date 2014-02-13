module Skywriter
  class Resource
    module EC2
      class RouteTable < Skywriter::Resource
        property :VpcId
        property :Tags
      end
    end
  end
end
