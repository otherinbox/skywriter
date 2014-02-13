module Skywriter
  module Resource
    module EC2
      class RouteTable
        include Skywriter::Resource

        property :VpcId
        property :Tags
      end
    end
  end
end
