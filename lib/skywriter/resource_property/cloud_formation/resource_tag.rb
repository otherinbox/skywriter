module Skywriter
  class ResourceProperty
    module CloudFormation
      class ResourceTag < Skywriter::ResourceProperty
        property :Key
        property :Value
      end

      ResourceTagsType = ResourceTag
      ResourceTags = ResourceTag
    end

    AWSCloudFormationResourceTagsType = CloudFormation::ResourceTag
    AWSCloudFormationResourceTags = CloudFormation::ResourceTag
  end
end
