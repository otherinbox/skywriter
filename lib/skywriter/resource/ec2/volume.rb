module Skywriter
  class Resource
    module EC2
      class Volume < Skywriter::Resource
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
