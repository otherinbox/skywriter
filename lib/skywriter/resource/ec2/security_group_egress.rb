module Skywriter
  module Resource
    module EC2
      # AWS::EC2::SecurityGroupEgress Resource
      #
      class SecurityGroupEgress
        include Skywriter::Resource

        property :GroupId
        property :IpProtocol
        property :CidrIp
        property :DestinationSecurityGroupId
        property :FromPort
        property :ToPort
      end
    end
  end
end
