module Skywriter
  class Resource
    module EC2
      class Subnet < Skywriter::Resource
        property :AvailabilityZone
        property :CidrBlock
        property :Tags
        property :VpcId
      end
    end
  end
end
