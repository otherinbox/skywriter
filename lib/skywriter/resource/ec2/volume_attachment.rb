module Skywriter
  class Resource
    module EC2
      class VolumeAttachment < Skywriter::Resource
        property :Device
        property :InstanceId
        property :VolumeId
      end
    end
  end
end
