require 'spec_helper'

describe Skywriter::Resource::CloudFront::Distribution do
  it "is a Resource" do
    expect(Skywriter::Resource::CloudFront::Distribution.new('name')).to be_a(Skywriter::Resource)
  end
end
