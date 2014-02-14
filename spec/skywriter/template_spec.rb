require 'spec_helper'

describe Skywriter::Template do
  describe "#to_json" do
    it "doesn't explode" do
      expect { Skywriter::Template.new.to_json }.to_not raise_error
    end
  end

  describe "#as_json" do
    context "with an empty object" do
      let(:template) { Skywriter::Template.new }
      let(:hash) { template.as_json }

      it "uses default FormatVersion value" do
        expect(hash['FormatVersion']).to eq('2010-09-09')
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

      it "has the passed FormatVersion value" do
        expect(hash['FormatVersion']).to eq('foo')
      end
    end

    context "with description" do
      let(:template) { Skywriter::Template.new(:description => 'foo') }
      let(:hash) { template.as_json }

      it "has a Description key" do
        expect(hash).to have_key('Description')
      end
    end

    context "with array of Resources" do
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

    context "with resources hash" do
      let(:template) do
        Skywriter::Template.new(
          resources: {"foo" => "bar"}
        )
      end

      it "includes resources hash" do
        expect(template.as_json['Resources']).to eq("foo" => "bar")
      end
    end

    context "with snake case symbol key name" do
      let(:template) do
        Skywriter::Template.new(
          resources: {"foo" => "bar"}
        )
      end

      it "sets value" do
        expect(template.as_json['Resources']).to eq("foo" => "bar")
      end
    end

    context "with snake case string key name" do
      let(:template) do
        Skywriter::Template.new(
          'resources' => {"foo" => "bar"}
        )
      end

      it "sets value" do
        expect(template.as_json['Resources']).to eq("foo" => "bar")
      end
    end

    context "with CameCase symbol key name" do
      let(:template) do
        Skywriter::Template.new(
          Resources: {"foo" => "bar"}
        )
      end

      it "sets value" do
        expect(template.as_json['Resources']).to eq("foo" => "bar")
      end
    end

    context "with CamelCase string key name" do
      let(:template) do
        Skywriter::Template.new(
          'Resources' => {"foo" => "bar"}
        )
      end

      it "sets value" do
        expect(template.as_json['Resources']).to eq("foo" => "bar")
      end
    end
  end

  describe "#merge" do
    let(:resource) do
      double("Resource", as_json: {'foo' => 'bar'})
    end

    let(:template) do
      Skywriter::Template.new(
        parameters: {'foo' => 'bar'},
        mappings: {'foo' => 'bar'},
        conditions: {'foo' => 'bar'},
        resources: [resource],
        outputs: {'foo' => 'bar'},
      )
    end

    context "with another template containing conflicting values" do
      let(:other_template) { Skywriter::Template.new(format_version: 'other format version') }

      it "raises a MergeError" do
        expect { template.merge(other_template) }.to raise_error(Skywriter::Template::MergeError)
      end
    end

    context "with another template containing disjoint values" do
      let(:other_template) { Skywriter::Template.new(description: 'description') }

      it "sets the value on returned template" do
        expect(template.merge(other_template).description).to eq('description')
      end
    end

    # Disjoint
    #
    context "where the values of 'other' are disjoint" do
      let(:disjoint_resource) do
        double("OtherResource", as_json: {'baz' => 'qux'})
      end

      let(:disjoint_template) do
        Skywriter::Template.new(
          parameters: {'baz' => 'qux'},
          mappings: {'baz' => 'qux'},
          conditions: {'baz' => 'qux'},
          resources: [disjoint_resource],
          outputs: {'baz' => 'qux'},
        )
      end

      subject { template.merge(disjoint_template) }

      ['Parameters', 'Mappings', 'Conditions', 'Resources', 'Outputs'].each do |meth|
        it "sets value of #{meth} to 'other' merged into 'self'" do
          disjoint_template.as_json[meth].each_key do |other_key|
            expect(subject.as_json[meth]).to have_key(other_key)
          end
        end
      end
    end

    # Duplicate
    #
    context "where the values of 'other' are duplicated" do
      subject { template.merge(template) }

      [:parameters, :mappings, :conditions, :resources, :outputs].each do |meth|
        it "sets value of #{meth} to value from 'self'" do
          template.send(meth).each_key do |other_key|
            expect(subject.send(meth)).to have_key(other_key)
          end
        end
      end
    end

    # Conflicting
    #
    context "where the values of 'other' are conflicting" do
      let(:conflicting_resource) do
        double("ConflictingResource", as_json: {'foo' => 'not bar'})
      end

      let(:conflicting_template) do
        Skywriter::Template.new(
          parameters: {'foo' => 'not bar'},
          mappings: {'foo' => 'not bar'},
          conditions: {'foo' => 'not bar'},
          resources: [conflicting_resource],
          outputs: {'foo' => 'not bar'},
        )
      end

      it "raises an exception" do
        expect { template.merge(conflicting_template) }.to raise_error(Skywriter::Template::MergeError)
      end
    end
  end
end
