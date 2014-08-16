module Skywriter
  class StackPolicy
    class Permission
      include Skywriter::ArgumentParser

      attr_reader :effect, :action, :resource, :condition

      # CloudFormation Stack Policy Permission
      #
      # Represents one of the statements an a stack policy, limiting or granting
      # access to a set of resources for a set of actions at some point in the 
      # stack's lifecycle
      #
      # @param [String] effect Determines whether the actions that you specify 
      #   are denied or allowed on the resource that you specify. You can specify 
      #   only 'Deny' or 'Allow' 
      # @param [String] action Specifies the update actions that are denied or 
      #   allowed. You can specify 'Update:Modify', 'Update:Replace', 
      #   'Update:Delete' or 'Update:*'
      # @param [String] resource Specifies the logical IDs of the resources that 
      #   the policy applies to.  If you want permissions to apply to all
      #   instances of a type of resource, use the 'condition' argument.
      # @param [Hash, StackPolicy::Condition] condition Specifies the resource 
      #   type that the policy applies to.  If you want the permission to apply
      #   to a specific instance of a resource, use the 'resource' argument.
      #
      # @example
      #   Skywriter::StackPolicyPermission.new(
      #     effect: 'Deny',
      #     action: 'update_actions',
      #     resource: 'LogicalResourceId/resource_logical_ID',
      #     condition: Skywriter::StackPolicy::Condition.new(
      #       resource_type: 'AWS::EC2::Instance',
      #     )
      #   )
      #
      def initialize(options = {})
        @effect = access_liberally(options, :effect).freeze
        @action = access_liberally(options, :action).freeze
        @resource = access_liberally(options, :resource).freeze
        @condition = access_liberally(options, :condition).freeze
      end

      def as_json(*)
        {
          "Effect" => effect,
          "Action" => action,
          "Principal" => '*',  # Required for some reason, but must be '*'
          "Resource" => resource,
          "Condition" => condition.as_json,
        }.reject { |key, value| value.nil? }
      end
    end
  end
end
