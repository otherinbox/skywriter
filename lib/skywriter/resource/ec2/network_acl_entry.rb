module Skywriter
  class Resource
    module EC2
      class NetworkAclEntry < Skywriter::Resource
        property :CidrBlock
        property :Egress
        property :Icmp
        property :NetworkAclId
        property :PortRange
        property :Protocol
        property :RuleAction
        property :RuleNumber
      end
    end
  end
end
