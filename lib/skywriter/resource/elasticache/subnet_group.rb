module Skywriter
  class Resource
    module ElastiCache
      class SubnetGroup < Skywriter::Resource
        property :Description
        property :SubnetIds
      end
    end
  end
end
