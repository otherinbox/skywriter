module Skywriter
  module Function
    def self.ref(logical_name)
      { "Ref" => logical_name }
    end

    def self.base64(value)
      { "Fn::Base64" => value }
    end

    def self.find_in_map(map, *values)
      { "Fn::FindInMap" => Array(map) + values }
    end

    def self.get_att(resource_name, attribute_name)
      { "Fn::GetAtt" => [resource_name, attribute_name] }
    end

    def self.get_azs(region = nil)
      { "Fn::GetAZs" => region.to_s }
    end

    def self.join(sep, *values)
      { "Fn::Join" => [sep.to_s, values] }
    end

    def self.select(index, *values)
      { "Fn::Select" => [index.to_s, values] }
    end

    # Conditionals
    def self.and(*conditions)
      { "Fn::And" => conditions }
    end

    def self.equals(left, right)
      { "Fn::Equals" => [left, right] }
    end

    def self.if(condition, when_true, when_false)
      { "Fn::If" => [condition, when_true, when_false] }
    end

    def self.not(condition)
      { "Fn::Not" => [condition] }
    end

    def self.or(*conditions)
      { "Fn::Or" => conditions }
    end
  end
end
