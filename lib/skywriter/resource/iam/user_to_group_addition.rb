module Skywriter
  module Resource
    module IAM
      class UserToGroupAddition
        include Skywriter::Resource

        property :GroupName
        property :Users
      end
    end
  end
end

