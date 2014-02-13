module Skywriter
  class ResourceProperty
    module EC2
      class ICMP < Skywriter::ResourceProperty
        property :Code
        property :Type
      end
    end
  end
end
