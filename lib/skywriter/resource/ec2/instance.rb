module Skywriter
  module Resource
    module EC2
      # AWS::EC2::Instance Resource
      #
      class Instance
        include Skywriter::Resource

        property :AvailabilityZone
        property :BlockDeviceMappings
        property :DisableApiTermination
        property :EbsOptimized
        property :IamInstanceProfile
        property :ImageId
        property :InstanceType
        property :KernelId
        property :KeyName
        property :Monitoring
        property :NetworkInterfaces
        property :PlacementGroupName
        property :PrivateIpAddress
        property :RamdiskId
        property :SecurityGroupIds
        property :SecurityGroups
        property :SourceDestCheck
        property :SubnetId
        property :Tags
        property :Tenancy
        property :UserData
        property :Volumes
      end
    end
  end
end
