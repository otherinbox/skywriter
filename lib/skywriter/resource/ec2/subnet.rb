module Skywriter
  module Resource
    module EC2
      class Subnet
        include Skywriter::Resource

        property :AvailabilityZone
        property :CidrBlock
        property :Tags
        property :VpcId
      end
    end
  end
end
