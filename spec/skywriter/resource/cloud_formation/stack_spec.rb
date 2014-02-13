require 'spec_helper'

describe Skywriter::Resource::CloudFormation::Stack do
  it "is a Resource" do
    expect(Skywriter::Resource::CloudFormation::Stack.new('name')).to be_a(Skywriter::Resource)
  end
end
