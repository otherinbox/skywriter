require 'spec_helper'

describe SkyWriter::Resource::EC2::SecurityGroup do
  it "is a Resource" do
    expect(SkyWriter::Resource::EC2::SecurityGroup.new('name')).to be_a(SkyWriter::Resource)
  end
end
