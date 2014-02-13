module Skywriter
  class ResourceProperty
    module Redshift
      class Parameter < Skywriter::ResourceProperty
        property :ParameterName
        property :ParameterValue
      end

      ParameterType = Parameter
    end

    AmazonRedshiftParameterType = Redshift::Parameter
    AmazonRedshiftParameter = Redshift::Parameter
  end
end
