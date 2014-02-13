require 'spec_helper'

describe Skywriter::Resource::CloudFormation::Authentication do
  it "is a Resource" do
    expect(Skywriter::Resource::CloudFormation::Authentication.new('name')).to be_a(Skywriter::Resource)
  end

  describe "#as_json" do
    it "allows the user to define the keyspace" do
      resource = Skywriter::Resource::CloudFormation::Authentication.new(
        'name',
        Foo: {
          access_key_id: 'some kind of key'
        },
        Bar: {
          access_key_id: 'some other kind of key'
        }
      )

      expect(resource.as_json).to eq(
        {
          'name' => {
            'Type' => "AWS::CloudFormation::Authentication",
            'Foo' => {
              'accessKeyId' => 'some kind of key',
            },
            'Bar' => {
              'accessKeyId' => 'some other kind of key',
            },
            'DependsOn' => [],
          }
        }
      )
    end
  end
end
