module Skywriter
  module Resource
    module RDS
      # AWS::RDS::DBSubnetGroup Resource
      # 
      class DBSubnetGroup
        include Skywriter::Resource

        property :DBSubnetGroupDescription
        property :SubnetIds
        property :Tags
      end
    end
  end
end

