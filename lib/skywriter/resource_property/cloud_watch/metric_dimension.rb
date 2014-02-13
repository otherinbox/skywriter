module Skywriter
  class ResourceProperty
    module CloudWatch
      class MetricDimension < Skywriter::ResourceProperty
        property :Name
        property :Value
      end
    end
  end
end
