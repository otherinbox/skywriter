module Skywriter
  module Resource
    module ElastiCache
      # AWS::ElastiCache::SecurityGroupIngress Resource
      # 
      class SecurityGroupIngress
        include Skywriter::Resource

        property :CacheSecurityGroupName
        property :EC2SecurityGroupName
        property :EC2SecurityGroupOwnerId
      end
    end
  end
end
