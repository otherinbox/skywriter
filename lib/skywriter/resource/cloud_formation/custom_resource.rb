module Skywriter
  class Resource
    module CloudFormation
      class CustomResource < Skywriter::Resource
        private

        def properties
          @options
        end
      end
    end
  end
end
