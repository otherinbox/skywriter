module Skywriter
  module Resource
    module IAM
      class User
        include Skywriter::Resource

        property :Path
        property :Groups
        property :LoginProfile
        property :Policies
      end
    end
  end
end

