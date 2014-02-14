module Skywriter
  module Resource
    module IAM
      # AWS::IAM::AccessKey Resource
      # 
      class AccessKey
        include Skywriter::Resource

        property :Serial
        property :Status
        property :UserName
      end
    end
  end
end

