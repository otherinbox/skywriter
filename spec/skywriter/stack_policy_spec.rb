describe Skywriter::StackPolicy do
  describe "#to_json" do
    it "doesn't explode" do
      expect { Skywriter::StackPolicy.new.to_json }.to_not raise_error
    end
    
  end

  describe "#as_json" do
    context "with empty permissions" do
      let(:policy) { Skywriter::StackPolicy.new }
      let(:hash) { policy.as_json }

      it "has a Statement key" do
        expect(hash).to have_key('Statement')
      end
    end

    context "with permission" do
      let(:policy) { Skywriter::StackPolicy.new(:statement => 'foo') }
      let(:hash) { policy.as_json }

      it "has a Statement value" do
        expect(hash['Statement']).to eq(['foo'])
      end
    end

    context "with permissions" do
      let(:policy) { Skywriter::StackPolicy.new(:statement => ['foo']) }
      let(:hash) { policy.as_json }

      it "has a Statement value" do
        expect(hash['Statement']).to eq(['foo'])
      end
    end

    context "with string key" do
      let(:policy) { Skywriter::StackPolicy.new('Statement' => ['foo']) }
      let(:hash) { policy.as_json }

      it "has a Statement value" do
        expect(hash['Statement']).to eq(['foo'])
      end
    end
  end

  describe "#merge" do
    let(:policy_1) do
      Skywriter::StackPolicy.new(statement: [:permission_1, :permission_2])
    end

    let(:policy_2) do
      Skywriter::StackPolicy.new(statement: [:permission_2, :permission_3])
    end

    let(:hash_policy) do
      policy_2.as_json
    end

    it "returns a policy with the union of self and other's permissions" do
      expect(policy_1.merge(policy_2).as_json).to eq(
        "Statement" => ["permission_1", "permission_2", "permission_3"]
      )
    end

    it "returns a policy with the union of self and other's permissions when other is a hash" do
      expect(policy_1.merge(hash_policy).as_json).to eq(
        "Statement" => ["permission_1", "permission_2", "permission_3"]
      )
    end
  end

  describe "#empty?" do
    context "with no permissions" do
      let(:policy) { Skywriter::StackPolicy.new }

      it "returns true" do
        expect(policy.empty?).to eq(true)
      end
    end

    context "with permissions" do
      let(:policy) { Skywriter::StackPolicy.new(:statement => 'foo') }

      it "returns false" do
        expect(policy.empty?).to eq(false)
      end
    end
  end
end
