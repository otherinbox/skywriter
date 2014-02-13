require 'spec_helper'

describe Skywriter::Template do
  describe "#as_json" do
    context "with an empty object" do
      let(:template) { Skywriter::Template.new }
      let(:hash) { template.as_json }

      it "does not have a FormatVersion key" do
        expect(hash).to_not have_key('FormatVersion')
      end

      it "does not have a Description key" do
        expect(hash).to_not have_key('Description')
      end

      it "has a Parameters key" do
        expect(hash).to have_key('Parameters')
      end

      it "has a Mappings key" do
        expect(hash).to have_key('Mappings')
      end

      it "has a Conditions key" do
        expect(hash).to have_key('Conditions')
      end

      it "has a Resources key" do
        expect(hash).to have_key('Resources')
      end

      it "has a Outputs key" do
        expect(hash).to have_key('Outputs')
      end
    end

    context "with format version" do
      let(:template) { Skywriter::Template.new(:format_version => 'foo') }
      let(:hash) { template.as_json }

      it "has a FormatVersion key" do
        expect(hash).to have_key('FormatVersion')
      end
    end

    context "with description" do
      let(:template) { Skywriter::Template.new(:description => 'foo') }
      let(:hash) { template.as_json }

      it "has a Description key" do
        expect(hash).to have_key('Description')
      end
    end

    context "with resources" do
      let(:resource) do
        double("Resource", as_json: {"Resource" => {}})
      end

      let(:other_resource) do
        double("OtherResource", as_json: {"OtherResource" => {}})
      end

      let(:template) do
        Skywriter::Template.new(
          resources: [resource, other_resource]
        )
      end

      let(:hash) { template.as_json }

      it "includes resources" do
        expect(hash['Resources']).to have_key('Resource')
        expect(hash['Resources']).to have_key('OtherResource')
      end
    end
  end
end
