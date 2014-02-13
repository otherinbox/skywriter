module Skywriter
  class Resource
    module AutoScaling
      class LaunchConfiguration < Skywriter::Resource
        property :AssociatePublicIpAddress
        property :BlockDeviceMappings
        property :EbsOptimized
        property :IamInstanceProfile
        property :ImageId
        property :InstanceId
        property :InstanceMonitoring
        property :InstanceType
        property :KernelId
        property :KeyName
        property :RamDiskId
        property :SecurityGroups
        property :SpotPrice
        property :UserData
      end
    end
  end
end
