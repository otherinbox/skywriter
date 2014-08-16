module Skywriter
  class StackPolicy
    include Skywriter::ArgumentParser

    attr_reader :statement

    # CloudFormation Stack Policy
    #
    # Stack policies are JSON documents that define which update actions users 
    # can do and which resources they can take action on.
    #
    # @param [Array<Hash>, Array<StackPolicy::Permission] statement Stack policy
    #   permissions.  Each permission defines a restriction on a set of resource
    #   types
    #
    # @example
    #   allow_all = Skywriter::StackPolicy::Permission.new(
    #     effect: 'Allow',
    #     action: 'Update:*',
    #     resource: '*',
    #   )
    #
    #   protect_database = Skywriter::StackPolicy::Permission.new(
    #     effect: 'Deny',
    #     action: 'Update:*',
    #     resource: 'LogicalResourceId/ProductionDatabase',
    #   )
    #
    #   Skywriter::StackPolicy.new(
    #     statement: [allow_all, protect_database],
    #   )
    #
    # Setting stack policies using the AWS client can be done using the 
    # `AWS::CloudFormation::Client` directly, for example:
    #
    # @example
    #   cf_client = AWS::CloudFormation.new.client
    #
    #   stack_policy = Skywriter::StackPolicy.new(
    #     statement: Skywriter::StackPolicy::Permission.new(effect: 'allow', resource: '*')
    #   )
    #
    #   cf_client.set_stack_policy(
    #     stack_name: 'MyStack',
    #     stack_policy_body: stack_policy.to_json
    #   )
    #
    def initialize(options = {})
      @statement = Array(access_liberally(options, :statement) || [])
    end

    def as_json(*)
      { "Statement" => statement.map(&:as_json) }
    end

    # Merge another Skywriter::StackPolicy (or hash describing same) into a new instance
    #
    # @example
    #   allow_all_policy = Skywriter::StackPolicy.new(
    #     statement: Skywriter::StackPolicy::Permission.new(
    #       effect: 'Allow',
    #       action: 'Update:*',
    #       resource: '*',
    #     )
    #   )
    #
    #   protect_database_policy = Skywriter::StackPolicy.new(
    #     statement: Skywriter::StackPolicy::Permission.new(
    #       effect: 'Deny',
    #       action: 'Update:*',
    #       resource: 'LogicalResourceId/ProductionDatabase',
    #     )
    #   )
    #
    #   combined_policy = allow_all_policy.merge(protect_database_policy)
    #
    #   combined_policy.as_json  # =>   {
    #                            #        "Statement": [
    #                            #          {
    #                            #            "Resource": "*",
    #                            #            "Principal": "*",
    #                            #            "Action": "Update:*",
    #                            #            "Effect": "Allow"
    #                            #          },
    #                            #          {
    #                            #            "Resource": "LogicalResourceId/ProductionDatabase",
    #                            #            "Principal": "*",
    #                            #            "Action": "Update:*",
    #                            #            "Effect": "Deny"
    #                            #          }
    #                            #        ]
    #                            #      }
    def merge(other)
      statement_union = as_json['Statement'] + other.as_json['Statement']

      self.class.new(statement: statement_union.uniq)
    end
    
    # Returns true if the instance defines to permissions
    def empty?
      statement.empty?
    end
  end
end
