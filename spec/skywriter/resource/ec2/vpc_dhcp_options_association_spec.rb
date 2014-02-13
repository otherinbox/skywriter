require 'spec_helper'

describe Skywriter::Resource::EC2::VPCDHCPOptionsAssociation do
  it "is a Resource" do
    expect(Skywriter::Resource::EC2::VPCDHCPOptionsAssociation.new('name')).to be_a(Skywriter::Resource)
  end
end
