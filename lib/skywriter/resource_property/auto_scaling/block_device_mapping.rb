module Skywriter
  class ResourceProperty
    module AutoScaling
      class BlockDeviceMapping < Skywriter::ResourceProperty
        property :DeviceName
        property :Ebs
        property :NoDevice
        property :VirtualName
      end
    end
  end
end
