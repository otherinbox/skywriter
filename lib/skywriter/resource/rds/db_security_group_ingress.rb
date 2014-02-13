module Skywriter
  module Resource
    module RDS
      class DBSecurityGroupIngress
        include Skywriter::Resource

        property :CIDRIP
        property :DBSecurityGroupName
        property :EC2SecurityGroupId
        property :EC2SecurityGroupName
        property :EC2SecurityGroupOwnerId
      end
    end
  end
end

