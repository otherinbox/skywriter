require 'spec_helper'

describe Skywriter::Resource::CloudFormation::Authentication do
  it "is a Resource" do
    expect(Skywriter::Resource::CloudFormation::Authentication.new('name')).to be_a(Skywriter::Resource)
  end
end
