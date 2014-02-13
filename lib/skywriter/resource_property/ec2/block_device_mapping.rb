module Skywriter
  class ResourceProperty
    module EC2
      class BlockDeviceMapping < Skywriter::ResourceProperty
        property :DeviceName
        property :Ebs
        property :NoDevice
        property :VirtualName
      end
    end
  end
end
