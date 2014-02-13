require 'spec_helper'

describe Skywriter::Resource::DynamoDB::Table do
  it "is a Resource" do
    expect(Skywriter::Resource::DynamoDB::Table.new('name')).to be_a(Skywriter::Resource)
  end
end
