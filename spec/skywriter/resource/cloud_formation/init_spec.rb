require 'spec_helper'

describe Skywriter::Resource::CloudFormation::Init do
  it "is a Resource" do
    expect(Skywriter::Resource::CloudFormation::Init.new('name')).to be_a(Skywriter::Resource)
  end
end
