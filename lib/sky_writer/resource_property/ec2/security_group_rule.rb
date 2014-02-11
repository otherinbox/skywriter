module SkyWriter
  module ResourceProperty
    module EC2
      class SecurityGroupRule

        def initialize(**options)
        end

        def as_json
          {
            FromPort: from_port,
            ToPort: to_port,
            IpProtocol: ip_protocol,
            CirdIp: cidr_ip,
            SourceSecurityGroupId: source_security_group_id,
            SourceSecurityGroupOwnerId: source_security_group_owner_id,
            SourceSecurityGroupName: source_security_group_name,
            DestinationSecurityGroupId: destination_security_group_id,
          }.reject { |key, value| value.nil? || value.empty? }
        end
      end
    end
  end
end
