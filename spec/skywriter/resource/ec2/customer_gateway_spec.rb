require 'spec_helper'

describe Skywriter::Resource::EC2::CustomerGateway do
  it "is a Resource" do
    expect(Skywriter::Resource::EC2::CustomerGateway.new('name')).to be_a(Skywriter::Resource)
  end
end
