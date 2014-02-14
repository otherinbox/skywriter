module Skywriter
  module Resource
    module ElastiCache
      # AWS::ElastiCache::ParameterGroup Resource
      # 
      class ParameterGroup
        include Skywriter::Resource

        property :CacheParameterGroupFamily
        property :Description
        property :Properties    # Yeah, I know...
      end
    end
  end
end
