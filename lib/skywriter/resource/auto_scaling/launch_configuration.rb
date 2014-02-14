module Skywriter
  module Resource
    module AutoScaling
      # AWS::AutoScaling::LaunchConfiguration Resource
      #
      # http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-launchconfig.html
      #
      class LaunchConfiguration
        include Skywriter::Resource

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
