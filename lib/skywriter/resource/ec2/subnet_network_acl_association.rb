module Skywriter
  class Resource
    module EC2
      class SubnetNetworkAclAssociation < Skywriter::Resource
        property :SubnetId
        property :NetworkAclId
      end
    end
  end
end
