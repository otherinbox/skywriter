require 'spec_helper'

describe SkyWriter::Resource::EC2::SecurityGroup do
  let(:resource) do
    SkyWriter::Resource::EC2::SecurityGroup.new(
      group_description: "Test Security Group",
      security_group_ingress: [
        SkyWriter::ResourceProperty::EC2::SecurityGroupRule.new(
          from_port: 8000,
          to_port: 8000,
          ip_protocol: 'tcp',
          cidr_ip: '0.0.0.0/0',
        )
      ],
    )
  end

  describe "#as_json" do
    it "sets group description property" do
      expect(resource.as_json['Properties']['GroupDescription']).to eq("Test Security Group")
    end
  end
end
