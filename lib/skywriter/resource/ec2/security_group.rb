module Skywriter
  class Resource
    module EC2
      class SecurityGroup < Skywriter::Resource
        property :GroupDescription
        property :SecurityGroupEgress
        property :SecurityGroupIngress
        property :VpcId
        property :Tags
      end
    end
  end
end
