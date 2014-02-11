module SkyWriter
  class ResourceProperty
    module EC2
      class SecurityGroupRule < SkyWriter::ResourceProperty
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
    end
  end
end
