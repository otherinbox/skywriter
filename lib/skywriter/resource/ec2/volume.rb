module Skywriter
  module Resource
    module EC2
      # AWS::EC2::Volume Resource
      # 
      class Volume
        include Skywriter::Resource

        property :AvailabilityZone
        property :Iops
        property :Size
        property :SnapshotId
        property :Tags
        property :VolumeType
      end
    end
  end
end
