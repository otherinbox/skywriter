module Skywriter
  class ResourceProperty
    module Redshift
      class Parameter < Skywriter::ResourceProperty
        property :ParameterName
        property :ParameterValue
      end
    end
  end
end
