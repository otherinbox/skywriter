require 'spec_helper'

describe Skywriter::Resource::EC2::EIPAssociation do
  it "is a Resource" do
    expect(Skywriter::Resource::EC2::EIPAssociation.new('name')).to be_a(Skywriter::Resource)
  end
end
