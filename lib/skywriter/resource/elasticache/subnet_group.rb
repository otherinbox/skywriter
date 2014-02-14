module Skywriter
  module Resource
    module ElastiCache
      # AWS::ElastiCache::SubnetGroup Resource
      # 
      class SubnetGroup
        include Skywriter::Resource

        property :Description
        property :SubnetIds
      end
    end
  end
end
