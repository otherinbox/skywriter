module Skywriter
  class ResourceProperty
    module EC2
      class BlockDeviceMapping < Skywriter::ResourceProperty
        property :DeviceName
        property :Ebs
        property :NoDevice
        property :VirtualName
      end

      BlockDeviceMappingPropertyType = BlockDeviceMapping
    end

    AWSCloudFormationEC2BlockDeviceMappingPropertyType = EC2::BlockDeviceMapping
    AWSCloudFormationEC2BlockDeviceMapping = EC2::BlockDeviceMapping
  end
end
