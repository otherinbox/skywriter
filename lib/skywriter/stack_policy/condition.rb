module Skywriter
  class StackPolicy
    class Condition
      include Skywriter::ArgumentParser

      attr_reader :resource_type

      # CloudFormation Stack Policy Condition
      #
      # Specifies resource types which a stack policy should apply to.  Used for
      # applying permissions to entire classes of resoruces - if you want
      # permissions to apply to specific resources use the 'Resource' element of
      # StackPolicy::Permission
      #
      # Amazon describes both 'StringEquals' and 'StringLike' conditions for some
      # reason, Skyriter::StackPolicy::Condition simply uses 'StringLike' as it
      # is a superset (ie, there are no values for which '*' is a valid literal)
      #
      # @param [String, Array<String>] resource_type Specifies the resource type 
      #   that the policy applies to. You can specify a resource type such as 
      #   all Amazon EC2 instances ('AWS::EC2::Instance') or all AWS RDS DB 
      #   Instances ('AWS::RDS::DBInstance')
      #
      # @example
      #   Skywriter::StackPolicy::StringEqualsConditions.new(
      #     resource_type: ["AWS::EC2*", "AWS::RDS::DBInstance"]
      #   )
      #
      #   Skywriter::StackPolicy::StringEqualsConditions.new(
      #     "ResourceType" => "AWS::EC2::Instance",
      #   )
      #
      def initialize(options = {})
        @resource_type = Array(access_liberally(options, :resource_type) || [])
      end

      def as_json(*)
        {
          "StringLike" => {
            "ResourceType" => resource_type
          }
        }
      end
    end
  end
end
