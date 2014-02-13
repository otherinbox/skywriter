require 'spec_helper'

describe Skywriter::Resource::AutoScaling::ScheduledAction do
  it "is a Resource" do
    expect(Skywriter::Resource::AutoScaling::ScheduledAction.new('name')).to be_a(Skywriter::Resource)
  end
end
