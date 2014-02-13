module Skywriter
  class Resource
    module RDS
      class DBSubnetGroup < Skywriter::Resource
        property :DBSubnetGroupDescription
        property :SubnetIds
        property :Tags
      end
    end
  end
end

