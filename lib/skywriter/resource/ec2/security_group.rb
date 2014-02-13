module Skywriter
  module Resource
    module EC2
      class SecurityGroup
        include Skywriter::Resource

        property :GroupDescription
        property :SecurityGroupEgress
        property :SecurityGroupIngress
        property :VpcId
        property :Tags
      end
    end
  end
end
