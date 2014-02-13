require 'spec_helper'

describe Skywriter::Resource::EC2::VPNGateway do
  it "is a Resource" do
    expect(Skywriter::Resource::EC2::VPNGateway.new('name')).to be_a(Skywriter::Resource)
  end
end
