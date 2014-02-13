module Skywriter
  class ResourceProperty
    module EC2
      class EBSBlockDevice < Skywriter::ResourceProperty
        property :DeleteOnTermination
        property :Iops
        property :SnapshotId
        property :VolumeSize
        property :VolumeType
      end

      BlockDevicePropertyType = EBSBlockDevice
      BlockDevice = EBSBlockDevice
    end

    AWSCloudFormationEC2BlockDevicePropertyType = EC2::EBSBlockDevice
    AWSCloudFormationEC2BlockDevice = EC2::EBSBlockDevice
  end
end
