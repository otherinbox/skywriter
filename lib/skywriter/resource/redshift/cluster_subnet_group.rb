module Skywriter
  class Resource
    module Redshift
      class ClusterSubnetGroup < Skywriter::Resource
        property :Description
        property :SubnetIds 
      end
    end
  end
end

