require 'spec_helper'

describe Skywriter::Function do
  describe "#ref" do
    it "returns expected value" do
      expect(Skywriter::Function.ref('value')).to eq("Ref" => 'value')
    end
  end

  describe "#base64" do
    it "returns expected value" do
      expect(Skywriter::Function.base64('value')).to eq("Fn::Base64" => 'value')
    end
  end

  describe "#find_in_map" do
    it "returns expected value" do
      expect(Skywriter::Function.find_in_map("MapName", "TopLevelKey", "SecondLevelKey")).to eq(
        "Fn::FindInMap" => ["MapName", "TopLevelKey", "SecondLevelKey"]
      )
    end
  end

  describe "#get_att" do
    it "returns expected value" do
      expect(Skywriter::Function.get_att('resource', 'attribute')).to eq(
        "Fn::GetAtt" => ['resource', 'attribute']
      )
    end
  end

  describe "#get_azs" do
    it "returns expected value" do
      expect(Skywriter::Function.get_azs('region')).to eq("Fn::GetAZs" => "region")
    end
  end

  describe "#join" do
    it "returns expected value" do
      expect(Skywriter::Function.join('delimiter', 'value1', 'value2')).to eq(
        "Fn::Join" => ["delimiter", ['value1', 'value2']]
      )
    end
  end

  describe "#select" do
    it "returns expected value" do
      expect(Skywriter::Function.select('1', 'apples', 'grapes', 'oranges', 'mangoes')).to eq(
        "Fn::Select" => [ "1", [ "apples", "grapes", "oranges", "mangoes" ] ]
      )
    end

    it "converts numeric index to string" do
      expect(Skywriter::Function.select(1, 'apples', 'grapes', 'oranges', 'mangoes')).to eq(
        "Fn::Select" => [ "1", [ "apples", "grapes", "oranges", "mangoes" ] ]
      )
    end
  end

  describe "#and" do
    it "returns expected value" do
      expect(Skywriter::Function.and('one', 'two')).to eq(
        "Fn::And" => ['one', 'two']
      )
    end
  end

  describe "#equals" do
    it "returns expected value" do
      expect(Skywriter::Function.equals('value_1', 'value_2')).to eq(
        "Fn::Equals" => ["value_1", "value_2"]
      )
    end
  end

  describe "#if" do
    it "returns expected value" do
      expect(Skywriter::Function.if('condition', 'when_true', 'when_false')).to eq(
        "Fn::If" => ['condition', 'when_true', 'when_false']
      )
    end
  end

  describe "#not" do
    it "returns expected value" do
      expect(Skywriter::Function.not('condition')).to eq(
        "Fn::Not" => ['condition']
      )
    end
  end

  describe "#or" do
    it "returns expected value" do
      expect(Skywriter::Function.or('condition 1', 'condition 2')).to eq(
        "Fn::Or" => ['condition 1', 'condition 2']
      )
    end
  end
end
