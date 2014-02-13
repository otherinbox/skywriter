require 'spec_helper'

describe Skywriter::Resource::AutoScaling::AutoScalingGroup do
  it "is a Resource" do
    expect(Skywriter::Resource::AutoScaling::AutoScalingGroup.new('name')).to be_a(Skywriter::Resource)
  end
end
