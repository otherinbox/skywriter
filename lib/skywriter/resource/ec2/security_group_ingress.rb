module Skywriter
  class Resource
    module EC2
      class SecurityGroupIngress < Skywriter::Resource
        property :GroupName
        property :GroupId
        property :IpProtocol
        property :CidrIp
        property :SourceSecurityGroupName
        property :SourceSecurityGroupId
        property :SourceSecurityGroupOwnerId
        property :FromPort
        property :ToPort
      end
    end
  end
end
