require 'spec_helper'

describe SkyWriter::Resource::EC2::VPC do
  it "is a Resource" do
    expect(SkyWriter::Resource::EC2::VPC.new('name')).to be_a(SkyWriter::Resource)
  end
end
