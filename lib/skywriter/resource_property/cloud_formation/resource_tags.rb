module Skywriter
  class ResourceProperty
    module CloudFormation
      class ResourceTags < Skywriter::ResourceProperty
        property :Key
        property :Value
      end
    end
  end
end
