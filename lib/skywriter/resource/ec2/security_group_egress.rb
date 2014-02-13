module Skywriter
  class Resource
    module EC2
      class SecurityGroupEgress < Skywriter::ResourceProperty::EC2::SecurityGroupRule
        property :DestinationSecurityGroupId
        property :GroupId
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
      SecurityGroupEgress = Skywriter::Resource::EC2::SecurityGroupEgress
    end
  end
end
