require 'spec_helper'

describe Skywriter::Resource::AutoScaling::LaunchConfiguration do
  it "is a Resource" do
    expect(Skywriter::Resource::AutoScaling::LaunchConfiguration.new('name')).to be_a(Skywriter::Resource)
  end
end
