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
    end
  end
end

