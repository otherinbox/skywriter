module Skywriter
  class Resource
    module IAM
      class UserToGroupAddition < Skywriter::Resource
        property :GroupName
        property :Users
      end
    end
  end
end

