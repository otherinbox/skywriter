module Skywriter
  module Resource
    module CloudFormation
      class CustomResource
        include Skywriter::Resource

        private

        def properties
          @options
        end
      end
    end
  end
end
