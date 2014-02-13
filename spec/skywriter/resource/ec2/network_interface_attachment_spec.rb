require 'spec_helper'

describe Skywriter::Resource::EC2::NetworkInterfaceAttachment do
  it "is a Resource" do
    expect(Skywriter::Resource::EC2::NetworkInterfaceAttachment.new('name')).to be_a(Skywriter::Resource)
  end
end
