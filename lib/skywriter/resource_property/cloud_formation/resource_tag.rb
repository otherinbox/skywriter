module Skywriter
  class ResourceProperty
    module CloudFormation
      class ResourceTag < Skywriter::ResourceProperty
        property :Key
        property :Value
      end

      ResourceTags = ResourceTag
    end
  end
end
