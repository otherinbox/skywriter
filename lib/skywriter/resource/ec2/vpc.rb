module Skywriter
  class Resource
    module EC2
      class VPC < Skywriter::Resource
        property :CidrBlock
        property :EnableDnsSupport
        property :EnableDnsHostnames
        property :InstanceTenancy
        property :Tags
      end
    end
  end
end
