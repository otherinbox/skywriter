module Skywriter
  module Resource
    module ElastiCache
      class SecurityGroupIngress
        include Skywriter::Resource

        property :CacheSecurityGroupName
        property :EC2SecurityGroupName
        property :EC2SecurityGroupOwnerId
      end
    end
  end
end
