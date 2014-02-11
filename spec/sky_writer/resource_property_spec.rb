require 'spec_helper'

describe SkyWriter::ResourceProperty do
  let(:resource_property_class) do
    Class.new(SkyWriter::ResourceProperty) do
      property :FooBar, convert: :to_i
      property :BazQux
    end
  end

  describe "#as_json" do
    context "with missing properties" do
      subject { resource_property_class.new(foo_bar: '1').as_json }

      it "includes present properties" do
        expect(subject).to have_key(:FooBar)
      end

      it "excludes missing properties" do
        expect(subject).to_not have_key(:BazQux)
      end

      it "converts options appropriately" do
        expect(subject[:FooBar]).to be_a(Numeric)
      end
    end

    context "with nil properties" do
      subject { resource_property_class.new(foo_bar: '1', baz_qux: nil).as_json }

      it "includes present properties" do
        expect(subject).to have_key(:FooBar)
      end

      it "excludes nil properties" do
        expect(subject).to_not have_key(:BazQux)
      end
    end
  end
end
