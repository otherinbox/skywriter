module Skywriter
  module Resource
    module IAM
      # AWS::IAM::User Resource
      # 
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

