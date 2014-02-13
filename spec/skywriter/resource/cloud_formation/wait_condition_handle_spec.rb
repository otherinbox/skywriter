require 'spec_helper'

describe Skywriter::Resource::CloudFormation::WaitConditionHandle do
  it "is a Resource" do
    expect(Skywriter::Resource::CloudFormation::WaitConditionHandle.new('name')).to be_a(Skywriter::Resource)
  end
end
