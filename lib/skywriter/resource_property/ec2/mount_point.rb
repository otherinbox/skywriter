module Skywriter
  class ResourceProperty
    module EC2
      class MountPoint < Skywriter::ResourceProperty
        property :Device
        property :VolumeId
      end
    end
  end
end
