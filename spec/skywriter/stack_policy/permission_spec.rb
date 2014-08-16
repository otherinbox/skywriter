describe Skywriter::StackPolicy::Permission do
  describe "#as_json" do
    context "with empty resource types" do
      let(:permission) { Skywriter::StackPolicy::Permission.new }
      let(:hash) { permission.as_json }

      it "does not have an Effect key" do
        expect(hash).to_not have_key('Effect')
      end

      it "does not have an Action key" do
        expect(hash).to_not have_key('Action')
      end

      it "has a Principal key" do
        expect(hash).to have_key('Principal')
      end

      it "has a Principal value" do
        expect(hash['Principal']).to eq('*')
      end

      it "does not have a Resource key" do
        expect(hash).to_not have_key('Resource')
      end

      it "does not have a Condition key" do
        expect(hash).to_not have_key('Condition')
      end
    end

    context "with symbol effect key" do
      let(:permission) { Skywriter::StackPolicy::Permission.new(effect: 'foo') }
      let(:hash) { permission.as_json }

      it "has an Effect value" do
        expect(hash['Effect']).to eq('foo')
      end
    end

    context "with string effect key" do
      let(:permission) { Skywriter::StackPolicy::Permission.new('Effect' => 'foo') }
      let(:hash) { permission.as_json }

      it "has an Effect value" do
        expect(hash['Effect']).to eq('foo')
      end
    end

    context "with symbol action key" do
      let(:permission) { Skywriter::StackPolicy::Permission.new(action: 'foo') }
      let(:hash) { permission.as_json }

      it "has an Action value" do
        expect(hash['Action']).to eq('foo')
      end
    end

    context "with string action key" do
      let(:permission) { Skywriter::StackPolicy::Permission.new('Action' => 'foo') }
      let(:hash) { permission.as_json }

      it "has an Action value" do
        expect(hash['Action']).to eq('foo')
      end
    end

    context "with symbol resource key" do
      let(:permission) { Skywriter::StackPolicy::Permission.new(resource: 'foo') }
      let(:hash) { permission.as_json }

      it "has an Resource value" do
        expect(hash['Resource']).to eq('foo')
      end
    end

    context "with string resource key" do
      let(:permission) { Skywriter::StackPolicy::Permission.new('Resource' => 'foo') }
      let(:hash) { permission.as_json }

      it "has an Resource value" do
        expect(hash['Resource']).to eq('foo')
      end
    end

    context "with symbol condition key" do
      let(:permission) { Skywriter::StackPolicy::Permission.new(condition: 'foo') }
      let(:hash) { permission.as_json }

      it "has an Condition value" do
        expect(hash['Condition']).to eq('foo')
      end
    end

    context "with string condition key" do
      let(:permission) { Skywriter::StackPolicy::Permission.new('Condition' => 'foo') }
      let(:hash) { permission.as_json }

      it "has an Condition value" do
        expect(hash['Condition']).to eq('foo')
      end
    end
  end
end
