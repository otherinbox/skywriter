module Skywriter
  class Resource
    module CloudFormation
      class Stack < Skywriter::Resource
        property :TemplateURL
        property :TimeoutInMinutes
        property :Parameters
      end
    end
  end
end
