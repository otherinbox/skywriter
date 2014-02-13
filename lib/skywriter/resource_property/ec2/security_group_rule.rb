module Skywriter
  class ResourceProperty
    module EC2
      class SecurityGroupRule < Skywriter::ResourceProperty
        property :FromPort
        property :ToPort
        property :IpProtocol
        property :CidrIp
      end
    end
  end
end
