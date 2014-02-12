require 'spec_helper'

describe Skywriter::Resource::LogicalNamePointer do
  let(:resource) { double("Resource", logical_name: "logical name") }

  let(:pointer) do
    Skywriter::Resource::LogicalNamePointer.new(resource)
  end

  describe "#as_json" do
    it "returns the logical name" do
      expect(pointer.as_json).to eq("logical name")
    end
  end
end
