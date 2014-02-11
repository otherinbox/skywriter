require 'spec_helper'

describe SkyWriter::ResourceProperty::EC2::SecurityGroupRule do
  it "is a ResourceProperty" do
    expect(SkyWriter::ResourceProperty::EC2::SecurityGroupRule.new).to be_a(SkyWriter::ResourceProperty)
  end
end
