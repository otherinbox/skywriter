require 'spec_helper'

describe SkyWriter::Resource do
  let(:resource_class) do
    Class.new(SkyWriter::Resource) do
      property :FooBar

    end.tap do |klass|
      def klass.name
        "SkyWriter::Resource::TestResource"
      end
    end
  end

  describe "#as_json" do
    it "serializes literal property values" do
      resource = resource_class.new('resource name', foo_bar: 'value')

      expect(resource.as_json['resource name']['Properties']['FooBar']).to eq("value")
    end

    it "sets type" do
      resource = resource_class.new('resource name', foo_bar: 'value')

      expect(resource.as_json['resource name']['Type']).to eq("AWS::TestResource")
    end

    it "sets depends on key if rich object passed in"
  end

  describe "#as_pointer" do
    context "with no args" do
      subject { resource_class.new('resource name').as_pointer }

      it "returns a reference" do
        expect(subject).to be_a(SkyWriter::Resource::RefPointer)
      end
    end

    context "when asked for a ref" do
      subject { resource_class.new('resource name').as_pointer(with: :ref) }

      it "returns a logical id" do
        expect(subject).to be_a(SkyWriter::Resource::RefPointer)
      end
    end

    context "when asked for a logical id" do
      subject { resource_class.new('resource name').as_pointer(with: :logical_id) }

      it "returns a logical id" do
        expect(subject).to be_a(SkyWriter::Resource::LogicalIdPointer)
      end
    end
  end
end
