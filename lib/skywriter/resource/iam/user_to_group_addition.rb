module Skywriter
  module Resource
    module IAM
      # AWS::IAM::UserToGroupAddition Resource
      # 
      class UserToGroupAddition
        include Skywriter::Resource

        property :GroupName
        property :Users
      end
    end
  end
end

