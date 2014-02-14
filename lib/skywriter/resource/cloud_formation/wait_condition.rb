module Skywriter
  module Resource
    module CloudFormation
      # AWS::CloudFormation::WaitCondition Resource
      #
      class WaitCondition
        include Skywriter::Resource

        property :Count
        property :Handle
        property :Timeout
      end
    end
  end
end
