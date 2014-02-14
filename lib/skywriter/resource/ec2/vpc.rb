module Skywriter
  module Resource
    module EC2
      # AWS::EC2::VPC Resource
      # 
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
