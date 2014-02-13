module Skywriter
  module Resource
    module EC2
      class VolumeAttachment
        include Skywriter::Resource

        property :Device
        property :InstanceId
        property :VolumeId
      end
    end
  end
end
