require 'spec_helper'

describe Skywriter::Resource::RefPointer do
  let(:resource) { double("Resource", logical_name: "logical name") }

  let(:pointer) do
    Skywriter::Resource::RefPointer.new(resource)
  end

  describe "#as_json" do
    it "returns Ref" do
      expect(pointer.as_json).to eq("Ref" => "logical name")
    end
  end
end
