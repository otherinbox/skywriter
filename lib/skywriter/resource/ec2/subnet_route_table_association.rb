module Skywriter
  module Resource
    module EC2
      # AWS::EC2::SubnetRouteTableAssociation Resource
      # 
      class SubnetRouteTableAssociation
        include Skywriter::Resource

        property :RouteTableId
        property :SubnetId
      end
    end
  end
end
