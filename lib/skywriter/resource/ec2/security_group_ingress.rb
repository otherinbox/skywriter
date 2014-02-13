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

  # This is just for aliasing purposes. Despite the fact that Amazon documents
  # this class as a resource, it is, in fact, a resource property in all ways.
  # So, we put it in the place you'd expect if you were looking at the
  # CloudFormation documentations. And we're aliasing it below in the place
  # where you'd expect it if you have your head right about how this behaves.
  class ResourceProperty
    module EC2
      SecurityGroupIngress = Skywriter::Resource::EC2::SecurityGroupIngress
    end
  end
end
