module Skywriter
  class Resource
    module EC2
      class SecurityGroupEgress < Skywriter::Resource
        property :CidrIp
        property :DestinationSecurityGroupId
        property :FromPort
        property :GroupId
        property :IpProtocol
        property :ToPort
      end
    end
  end
end
