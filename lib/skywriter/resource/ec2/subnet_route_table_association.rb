module Skywriter
  module Resource
    module EC2
      class SubnetRouteTableAssociation
        include Skywriter::Resource

        property :RouteTableId
        property :SubnetId
      end
    end
  end
end
