require 'spec_helper'

describe Skywriter::Resource::AutoScaling::ScalingPolicy do
  it "is a Resource" do
    expect(Skywriter::Resource::AutoScaling::ScalingPolicy.new('name')).to be_a(Skywriter::Resource)
  end
end
