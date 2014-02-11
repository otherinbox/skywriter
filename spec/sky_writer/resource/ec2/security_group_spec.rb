require 'spec_helper'

describe SkyWriter::Resource::EC2::SecurityGroup do
  let(:resource) do
    SkyWriter::Resource::EC2::SecurityGroup.new(
      group_description: "Test Security Group",
      security_group_ingress: [
        SkyWriter::ResourceProperty::EC2::SecurityGroupRole.new
      ],
    )
  end

  describe "#as_json" do
    it "sets group description property" do
      expect(resource.as_json["Properties"]["GroupDescription"]).to eq("Test Security Group")
    end
  end
end
