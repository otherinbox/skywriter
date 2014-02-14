module Skywriter
  module Resource
    module IAM
      # AWS::IAM::Policy Resource
      # 
      class Policy
        include Skywriter::Resource

        property :Groups
        property :PolicyDocument
        property :PolicyName
        property :Roles
        property :Users
      end
    end
  end
end

