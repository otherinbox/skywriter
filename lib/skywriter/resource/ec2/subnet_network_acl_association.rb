module Skywriter
  module Resource
    module EC2
      class SubnetNetworkAclAssociation
        include Skywriter::Resource

        property :SubnetId
        property :NetworkAclId
      end
    end
  end
end
