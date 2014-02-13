require 'spec_helper'

describe Skywriter::Resource::CloudFormation::WaitCondition do
  it "is a Resource" do
    expect(Skywriter::Resource::CloudFormation::WaitCondition.new('name')).to be_a(Skywriter::Resource)
  end
end
