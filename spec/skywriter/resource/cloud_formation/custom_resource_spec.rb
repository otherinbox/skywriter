require 'spec_helper'

describe Skywriter::Resource::CloudFormation::CustomResource do
  it "is a Resource" do
    expect(Skywriter::Resource::CloudFormation::CustomResource.new('name')).to be_a(Skywriter::Resource)
  end

  describe "#as_json" do
    it "allows the user to define the keyspace" do
      resource = Skywriter::Resource::CloudFormation::CustomResource.new(
        'name',
        Foo: 'some foo value',
        Bar: { 'SomeKey' => 'some value' },
      )

      expect(resource.as_json).to eq(
        {
          'name' => {
            'Type' => "AWS::CloudFormation::CustomResource",
            'Properties' => {
              'Foo' => 'some foo value',
              'Bar' => { 'SomeKey' => 'some value' },
            },
            'DependsOn' => [],
          }
        }
      )
    end
  end
end
