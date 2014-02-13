module Skywriter
  class ResourceProperty
    module AutoScaling
      class Tag < Skywriter::ResourceProperty
        property :Key
        property :Value
        property :PropagateAtLaunch
      end
    end
  end
end

