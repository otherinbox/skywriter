require 'spec_helper'

describe SkyWriter::Resource::EC2::SecurityGroup do
  let(:vpc) { SkyWriter::Resource::EC2::VPC.new }

  let(:resource) do
    SkyWriter::Resource::EC2::SecurityGroup.new(
      group_description: "Test Security Group",
      security_group_ingress: [
        SkyWriter::ResourceProperty::EC2::SecurityGroupRule.new(
          from_port: '8000',
          to_port: '8000',
          ip_protocol: 'tcp',
          cidr_ip: '0.0.0.0/0',
        )
      ],
      vpc_id: vpc,
    )
  end

  describe "#as_json" do
    it "sets group description property" do
      expect(resource.as_json['Properties']['GroupDescription']).to eq("Test Security Group")
    end

    it "embeds nested ResourceProperty" do
      expect(resource.as_json['Properties']['SecurityGroupIngress'].first['FromPort']).to eq("8000")
    end

    it "references Resource" do
      expect(resource.as_json['Properties']['VpcId']).to eq("Ref" => "EC2VPC")
    end
  end
end
