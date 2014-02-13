module Skywriter
  class Resource
    module CloudFormation
      class WaitCondition < Skywriter::Resource
        property :Count
        property :Handle
        property :Timeout
      end
    end
  end
end
