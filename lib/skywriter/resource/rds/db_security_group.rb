module Skywriter
  module Resource
    module RDS
      # AWS::RDS::DBSecurityGroup Resource
      # 
      class DBSecurityGroup
        include Skywriter::Resource

        property :EC2VpcId
        property :DBSecurityGroupIngress
        property :GroupDescription
        property :Tags
      end
    end
  end
end

