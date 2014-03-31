module Skywriter
  class ResourceProperty
    module EC2
      class SecurityGroupRule < Skywriter::ResourceProperty
        property :FromPort
        property :ToPort
        property :IpProtocol
        property :CidrIp
        property :SourceSecurityGroupId
        property :SourceSecurityGroupName
        property :SourceSecurityGroupOwnerId
        property :DestinationSecurityGroupId
      end
    end
  end
end
