module Skywriter
  module Resource
    module Redshift
      # AWS::Redshift::ClusterSecurityGroupIngress Resource
      # 
      class ClusterSecurityGroupIngress
        include Skywriter::Resource

        property :ClusterSecurityGroupName
        property :CIDRIP
        property :EC2SecurityGroupName
        property :EC2SecurityGroupOwnerId
      end
    end
  end
end

