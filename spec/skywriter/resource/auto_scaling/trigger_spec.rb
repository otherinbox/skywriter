require 'spec_helper'

describe Skywriter::Resource::AutoScaling::Trigger do
  it "is a Resource" do
    expect(Skywriter::Resource::AutoScaling::Trigger.new('name')).to be_a(Skywriter::Resource)
  end
end
