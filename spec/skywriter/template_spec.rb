require 'spec_helper'

describe Skywriter::Template do
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
  end

  describe "#merge" do
    let(:resource) do
      double("Resource", as_json: {'foo' => 'bar'})
    end

    let(:other_resource) do
      double("OtherResource", as_json: {'baz' => 'qux'})
    end

    let(:conflicting_resource) do
      double("ConflictingResource", as_json: {'foo' => 'not bar'})
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

    let(:disjoint_template) do
      Skywriter::Template.new(
        parameters: {'baz' => 'qux'},
        mappings: {'baz' => 'qux'},
        conditions: {'baz' => 'qux'},
        resources: [other_resource],
        outputs: {'baz' => 'qux'},
      )
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

    let(:hash_template) do
      template.as_json
    end

    let(:disjoint_hash_template) do
      disjoint_template.as_json
    end

    let(:conflicting_hash_template) do
      conflicting_template.as_json
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

    # We're going to set up the template that will be merged into 'self'.  
    #
    # We'll handle three cases:
    #   * the case where 'other' has different keys than 'self' (disjoint)
    #   * the case where 'other' has the same keys _and_ values as 'self' (duplicate)
    #   * the case where 'other' has the same keys as 'self' and different values (conflicting)
    #
    # Unfortunately, our #let-s are only available inside an assertion, 
    # so we'll just pass the method name and #send it inside the assertion
    #
    {
      "where 'other' is a template" => {
        :disjoint => :disjoint_template, 
        :duplicate => :template,
        :conflicting => :conflicting_template
      },
      "where 'other' is a hash" => {
        :disjoint => :disjoint_hash_template,
        :duplicate => :hash_template,
        :conflicting => :conflicting_hash_template
      },
    }.each do |other_template_description, other_templates|

      # Disjoint
      #
      context "#{other_template_description} and their values are disjoint" do
        let(:other_template) { send(other_templates[:disjoint]) }

        subject { template.merge(other_template) }

        # (OK, so I lied - we're going to do a little more meta-testing so we don't
        #   have to write each of these out individually)
        #
        ['Parameters', 'Mappings', 'Conditions', 'Resources', 'Outputs'].each do |meth|
          it "sets value of #{meth} to 'other' merged into 'self'" do
            other_template.as_json[meth].each_key do |other_key|
              expect(subject.as_json[meth]).to have_key(other_key)
            end
          end
        end
      end

      # Duplicate
      #
      context "#{other_template_description} and their values are duplicated" do
        let(:other_template) { send(other_templates[:duplicate]) }

        subject { template.merge(other_template) }

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
      context "and their values are conflicting" do
        let(:other_template) { send(other_templates[:conflicting]) }

        it "raises an exception" do
          expect { template.merge(other_template) }.to raise_error(Skywriter::Template::MergeError)
        end
      end
    end
  end
end
