module Skywriter
  module Resource
    module EC2
      class VPC
        include Skywriter::Resource

        property :CidrBlock
        property :EnableDnsSupport
        property :EnableDnsHostnames
        property :InstanceTenancy
        property :Tags
      end
    end
  end
end
