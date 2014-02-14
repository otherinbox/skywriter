module Skywriter
  module Resource
    module IAM
      # AWS::IAM::InstanceProfile Resource
      # 
      class InstanceProfile
        include Skywriter::Resource

        property :Path
        property :Roles
      end
    end
  end
end

