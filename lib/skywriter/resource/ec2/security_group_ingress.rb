module Skywriter
  class Resource
    module EC2
      class SecurityGroupIngress < Skywriter::ResourceProperty::EC2::SecurityGroupRule
        property :GroupName
        property :GroupId
        property :SourceSecurityGroupName
        property :SourceSecurityGroupId
        property :SourceSecurityGroupOwnerId
      end
    end
  end

  class ResourceProperty
    module EC2
      SecurityGroupIngress = Skywriter::Resource::EC2::SecurityGroupIngress
    end
  end
end
