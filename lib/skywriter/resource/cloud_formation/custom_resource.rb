module Skywriter
  module Resource
    module CloudFormation
      # AWS::CloudFormation::CustomResource Resource
      #
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
