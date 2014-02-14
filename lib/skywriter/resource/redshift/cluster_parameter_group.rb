module Skywriter
  module Resource
    module Redshift
      # AWS::Redshift::ClusterParameterGroup Resource
      # 
      class ClusterParameterGroup
        include Skywriter::Resource

        property :Description
        property :ParameterGroupFamily
        property :Parameters
      end
    end
  end
end

