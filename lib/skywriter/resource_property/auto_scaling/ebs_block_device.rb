module Skywriter
  class ResourceProperty
    module AutoScaling
      class EBSBlockDevice < Skywriter::ResourceProperty
        property :DeleteOnTermination
        property :Iops
        property :SnapshotId
        property :VolumeSize
        property :VolumeType
      end

    BlockDevice = EBSBlockDevice

    end
  end
end

