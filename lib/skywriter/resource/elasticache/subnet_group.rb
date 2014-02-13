module Skywriter
  module Resource
    module ElastiCache
      class SubnetGroup
        include Skywriter::Resource

        property :Description
        property :SubnetIds
      end
    end
  end
end
