module Skywriter
  class Resource
    module Redshift
      class ClusterParameterGroup < Skywriter::Resource
        property :Description
        property :ParameterGroupFamily
        property :Parameters
      end
    end
  end
end

