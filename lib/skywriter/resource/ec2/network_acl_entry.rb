module Skywriter
  module Resource
    module EC2
      # AWS::EC2::NetworkAclEntry Resource
      #
      class NetworkAclEntry
        include Skywriter::Resource

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
