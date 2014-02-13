module Skywriter
  class Resource
    module EC2
      class SubnetRouteTableAssociation < Skywriter::Resource
        property :RouteTableId
        property :SubnetId
      end
    end
  end
end
