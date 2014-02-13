module Skywriter
  class ResourceProperty
    module RDS
      class SecurityGroupRule < Skywriter::ResourceProperty
        property :CIDRIP
        property :EC2SecurityGroupId
        property :EC2SecurityGroupName
        property :EC2SecurityGroupOwnerId
      end
    end
  end
end
