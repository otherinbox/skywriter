module Skywriter
  module Resource
    module Redshift
      # AWS::Redshift::ClusterSubnetGroup Resource
      # 
      class ClusterSubnetGroup
        include Skywriter::Resource

        property :Description
        property :SubnetIds 
      end
    end
  end
end

