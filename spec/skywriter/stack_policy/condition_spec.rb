describe Skywriter::StackPolicy::Condition do
  describe "#as_json" do
    context "with empty resource types" do
      let(:condition) { Skywriter::StackPolicy::Condition.new }
      let(:hash) { condition.as_json }

      it "has StringLike key" do
        expect(hash).to have_key('StringLike')
      end

      it "has StringLike.ResourceType key" do
        expect(hash['StringLike']).to have_key('ResourceType')
      end
    end

    context "with resource type" do
      let(:condition) { Skywriter::StackPolicy::Condition.new(resource_type: 'foo') }
      let(:hash) { condition.as_json }

      it "has StringLike.ResourceType value" do
        expect(hash['StringLike']['ResourceType']).to eq(['foo'])
      end
    end

    context "with enumerable resource type" do
      let(:condition) { Skywriter::StackPolicy::Condition.new(resource_type: ['foo', 'bar']) }
      let(:hash) { condition.as_json }

      it "has StringLike.ResourceType value" do
        expect(hash['StringLike']['ResourceType']).to eq(['foo', 'bar'])
      end
    end

    context "with string key" do
      let(:condition) { Skywriter::StackPolicy::Condition.new('ResourceType' => 'foo') }
      let(:hash) { condition.as_json }

      it "has StringLike.ResourceType value" do
        expect(hash['StringLike']['ResourceType']).to eq(['foo'])
      end
    end
  end
end
