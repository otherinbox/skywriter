require 'spec_helper'

describe Skywriter::Resource::CloudFormation::CustomResource do
  it "is a Resource" do
    expect(Skywriter::Resource::CloudFormation::CustomResource.new('name')).to be_a(Skywriter::Resource)
  end
end
