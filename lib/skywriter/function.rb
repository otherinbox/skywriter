module Skywriter
  module Function
    # Intrinstic function 'Ref'
    #
    # @param logical_name The logical name of the resource or parameter you want to dereference
    #
    # @return [Hash] A hash describing the function
    #
    def self.ref(logical_name)
      { "Ref" => logical_name }
    end

    # Intrinsic function Fn::Base64
    #
    # @param value The string value you want to convert to Base64.
    #
    # @return [Hash] A hash describing the function
    #
    def self.base64(value)
      { "Fn::Base64" => value }
    end

    # Intrinsic function Fn::FindInMap
    #
    # @param map The logical name of a mapping declared in the Mappings section that contains the keys and values.
    # @param *keys A list describing the n-th level keys to index
    #
    # @return [Hash] A hash describing the function
    #
    def self.find_in_map(map, *keys)
      { "Fn::FindInMap" => Array(map) + keys }
    end

    # Intrinsic function Fn::GetAtt
    #
    # @param resource_name The logical name of the resource that contains the attribute you want.
    # @param attribute_name The name of the resource-specific attribute whose value you want.
    #
    # @return [Hash] A hash describing the function
    #
    def self.get_att(resource_name, attribute_name)
      { "Fn::GetAtt" => [resource_name, attribute_name] }
    end

    # Intrinsic function Fn::GetAZs
    #
    # @param region The name of the region for which you want to get the Availability Zones.
    #
    # @return [Hash] A hash describing the function
    #
    def self.get_azs(region = nil)
      { "Fn::GetAZs" => region.to_s }
    end

    # Intrinsic function Fn::Join
    #
    # @param sep The value you want to occur between values
    # @param *values The values you wish to join
    #
    # @return [Hash] A hash describing the function
    #
    def self.join(sep, *values)
      { "Fn::Join" => [sep.to_s, values] }
    end

    # Intrinsic function Fn::Select
    #
    # @param index The index of the object to retrieve, zero-indexed
    # @param *values The list of objects to select from
    #
    # @return [Hash] A hash describing the function
    #
    def self.select(index, *values)
      { "Fn::Select" => [index.to_s, values] }
    end


    # Conditionals

    # Intrinsic conditional function Fn::And
    #
    # @param *conditions Conditions that evaluate to true or false.
    #
    # @return [Hash] A hash describing the conditional function
    #
    def self.and(*conditions)
      { "Fn::And" => conditions }
    end

    # Intrinsic conditional function Fn::Equals
    #
    # @param left A value of any type that you want to compare.
    # @param right A value of any type that you want to compare.
    #
    # @return [Hash] A hash describing the conditional function
    #
    def self.equals(left, right)
      { "Fn::Equals" => [left, right] }
    end

    # Intrinsic conditional function Fn::If
    #
    # @param condition A reference to a condition in the Conditions section
    # @param when_true A value to be returned if the specified condition evaluates to true
    # @param when_false A value to be returned if the specified condition evaluates to false
    #
    # @return [Hash] A hash describing the conditional function
    #
    def self.if(condition, when_true, when_false)
      { "Fn::If" => [condition, when_true, when_false] }
    end

    # Intrinsic conditional function Fn::Not
    #
    # @param condition A condition such as Fn::Equals that evaluates to true or false
    #
    # @return [Hash] A hash describing the conditional function
    #
    def self.not(condition)
      { "Fn::Not" => [condition] }
    end

    # Intrinsic conditional function Fn::Or
    #
    # @param *conditions Conditions that evaluate to true or false
    #
    # @return [Hash] A hash describing the conditional function
    #
    def self.or(*conditions)
      { "Fn::Or" => conditions }
    end
  end
end
