module Skywriter
  module Resource
    module IAM
      # AWS::IAM::Role Resource
      # 
      class Role
        include Skywriter::Resource

        property :AssumeRolePolicyDocument
        property :Path
        property :Policies
      end
    end
  end
end

