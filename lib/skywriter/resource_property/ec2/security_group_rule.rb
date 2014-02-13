module Skywriter
  class ResourceProperty
    module EC2
      class SecurityGroupRule < Skywriter::ResourceProperty
        property :FromPort
        property :ToPort
        property :IpProtocol
        property :CidrIp

        # Ingresses
        property :SourceSecurityGroupName
        property :SourceSecurityGroupOwnerId
        property :SourceSecurityGroupId

        # Egresses
        property :DestinationSecurityGroupId
      end

      SecurityGroupRulePropertyType = SecurityGroupRule
    end
  end
end
