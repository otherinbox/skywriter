require 'spec_helper'

describe SkyWriter::ResourceProperty::EC2::SecurityGroupRule do
  let(:resource_property) do
    SkyWriter::ResourceProperty::EC2::SecurityGroupRule.new(
      from_port: 22,
      to_port: 22,
      ip_protocol: 'tcp',
      cidr_ip: '0.0.0.0/0',
      source_security_group_id: 'foo',
      source_security_group_owner_id: 'bar',
      source_security_group_name: 'baz',
      destination_security_group_id: 'qux',
    )
  end

  let(:empty_resource_property) do
    SkyWriter::ResourceProperty::EC2::SecurityGroupRule.new(
      from_port: 22,
      to_port: 22,
      ip_protocol: 'tcp',
      cidr_ip: '0.0.0.0/0',
    )
  end

  describe "#as_json" do
    it "translates to JSON" do
      expect(resource_property.as_json).to eq(
        FromPort: '22',
        ToPort: '22',
        IpProtocol: 'tcp',
        CidrIp: '0.0.0.0/0',
        SourceSecurityGroupId: 'foo',
        SourceSecurityGroupOwnerId: 'bar',
        SourceSecurityGroupName: 'baz',
        DestinationSecurityGroupId: 'qux',
      )
    end
    
    it "drops empty keys" do
      expect(empty_resource_property.as_json).to eq(
        FromPort: '22',
        ToPort: '22',
        IpProtocol: 'tcp',
        CidrIp: '0.0.0.0/0',
      )
    end
  end
end
