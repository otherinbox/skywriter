module Skywriter
  module Resource
    module Redshift
      class ClusterSubnetGroup
        include Skywriter::Resource

        property :Description
        property :SubnetIds 
      end
    end
  end
end

