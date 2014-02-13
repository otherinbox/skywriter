require 'spec_helper'

describe Skywriter::Resource::EC2::SecurityGroupEgress do
  it "is a Resource" do
    expect(Skywriter::Resource::EC2::SecurityGroupEgress.new).to be_a(Skywriter::ResourceProperty)
  end
end
