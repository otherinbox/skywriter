module Skywriter
  class Resource
    module RDS
      class DBSecurityGroup < Skywriter::Resource
        property :EC2VpcId
        property :DBSecurityGroupIngress
        property :GroupDescription
        property :Tags
      end
    end
  end
end

