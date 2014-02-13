require 'spec_helper'

describe Skywriter::Resource::CloudWatch::Alarm do
  it "is a Resource" do
    expect(Skywriter::Resource::CloudWatch::Alarm.new('name')).to be_a(Skywriter::Resource)
  end
end
