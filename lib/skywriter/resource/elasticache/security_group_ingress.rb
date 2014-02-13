module Skywriter
  class Resource
    module ElastiCache
      class SecurityGroupIngress < Skywriter::Resource
        property :CacheSecurityGroupName
        property :EC2SecurityGroupName
        property :EC2SecurityGroupOwnerId
      end
    end
  end
end
