module Skywriter
  class Resource
    module ElastiCache
      class ParameterGroup < Skywriter::Resource
        property :CacheParameterGroupFamily
        property :Description
        property :Properties    # Yeah, I know...
      end
    end
  end
end
