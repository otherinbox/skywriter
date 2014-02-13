module Skywriter
  class ResourceProperty
    module EC2
      class Tag < Skywriter::ResourceProperty
        property :Key
        property :Value
      end
    end
  end
end
