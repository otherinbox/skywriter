module Skywriter
  class ResourceProperty
    module EC2
      class PortRange < Skywriter::ResourceProperty
        property :From
        property :To
      end

      PortRangePropertyType = PortRange
    end
  end
end
