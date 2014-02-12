require 'spec_helper'

describe Skywriter::ResourceProperty::EC2::SecurityGroupRule do
  it "is a ResourceProperty" do
    expect(Skywriter::ResourceProperty::EC2::SecurityGroupRule.new).to be_a(Skywriter::ResourceProperty)
  end
end
