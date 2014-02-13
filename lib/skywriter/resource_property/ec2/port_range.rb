module Skywriter
  class ResourceProperty
    module EC2
      class PortRange < Skywriter::ResourceProperty
        property :From
        property :To
      end
    end
  end
end
