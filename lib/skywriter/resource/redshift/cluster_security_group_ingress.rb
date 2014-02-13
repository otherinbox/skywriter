module Skywriter
  class Resource
    module Redshift
      class ClusterSecurityGroupIngress < Skywriter::Resource
        property :ClusterSecurityGroupName
        property :CIDRIP
        property :EC2SecurityGroupName
        property :EC2SecurityGroupOwnerId
      end
    end
  end
end

