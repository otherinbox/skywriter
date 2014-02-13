module Skywriter
  module Resource
    module RDS
      class DBSubnetGroup
        include Skywriter::Resource

        property :DBSubnetGroupDescription
        property :SubnetIds
        property :Tags
      end
    end
  end
end

