require 'spec_helper'

describe Skywriter::Resource::EC2::SecurityGroupIngress do
  it "is a Resource" do
    expect(Skywriter::Resource::EC2::SecurityGroupIngress.new).to be_a(Skywriter::ResourceProperty)
  end
end
