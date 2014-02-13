module Skywriter
  class ResourceProperty
    module CloudWatch
      class MetricDimension < Skywriter::ResourceProperty
        property :Name
        property :Value
      end

      MetricDimensionPropertyType = MetricDimension
    end
  end
end
