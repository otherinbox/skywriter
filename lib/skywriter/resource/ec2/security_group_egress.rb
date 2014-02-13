module Skywriter
  class Resource
    module EC2
      class SecurityGroupEgress < Skywriter::ResourceProperty::SecurityGroupRule
        property :DestinationSecurityGroupId
        property :GroupId
      end
    end
  end

  class ResourceProperty
    module EC2
      SecurityGroupEgress = Skywriter::Resource::EC2::SecurityGroupEgress
    end
  end
end
