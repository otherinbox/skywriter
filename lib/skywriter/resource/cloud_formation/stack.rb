module Skywriter
  module Resource
    module CloudFormation
      class Stack
        include Skywriter::Resource

        property :TemplateURL
        property :TimeoutInMinutes
        property :Parameters
      end
    end
  end
end
