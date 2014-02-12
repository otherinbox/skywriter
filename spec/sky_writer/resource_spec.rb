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

    it "sets additional dependencies" do
      resource = resource_class.new('resource name', additional_dependencies: 'value')

      expect(resource.as_json['resource name']['DependsOn']).to include('value')
    end

    it "sets depends on key if pointer passed" do
      reference = resource_class.new('reference')
      resource = resource_class.new('resource name', foo_bar: reference.as_pointer)

      expect(resource.as_json['resource name']['DependsOn']).to include('reference')
    end
    
    it "merges magical and additional depedencies" do
      reference = resource_class.new('reference')
      resource = resource_class.new('resource name', foo_bar: reference.as_pointer, additional_dependencies: ['depends on'])

      expect(resource.as_json['resource name']['DependsOn']).to include('reference')
      expect(resource.as_json['resource name']['DependsOn']).to include('depends on')
    end

    it "removes duplicate depedencies" do
      reference = resource_class.new('reference')
      resource = resource_class.new('resource name', foo_bar: reference.as_pointer, additional_dependencies: ['reference', 'reference'])

      expect(resource.as_json['resource name']['DependsOn']).to eq(['reference'])
    end
  end

  describe "#register_dependency" do
    it "adds logical name to dependency list" do
      resource = resource_class.new('resource')
      resource.register_dependency(double(logical_name: 'logical name'))

      expect(resource.as_json['resource']['DependsOn']).to include('logical name')
    end
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

      it "returns a logical name" do
        expect(subject).to be_a(SkyWriter::Resource::RefPointer)
      end
    end

    context "when asked for a logical name" do
      subject { resource_class.new('resource name').as_pointer(with: :logical_name) }

      it "returns a logical name" do
        expect(subject).to be_a(SkyWriter::Resource::LogicalNamePointer)
      end
    end
  end
end
