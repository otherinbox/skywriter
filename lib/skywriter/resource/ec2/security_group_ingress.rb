module Skywriter
  module Resource
    module EC2
      # AWS::EC2::SecurityGroupIngress Resource
      #
      class SecurityGroupIngress
        include Skywriter::Resource

        property :GroupName
        property :GroupId
        property :IpProtocol
        property :CidrIp
        property :SourceSecurityGroupName
        property :SourceSecurityGroupId
        property :SourceSecurityGroupOwnerId
        property :FromPort
        property :ToPort
      end
    end
  end
end
