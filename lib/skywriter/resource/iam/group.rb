module Skywriter
  module Resource
    module IAM
      # AWS::IAM::Group Resource
      # 
      class Group
        include Skywriter::Resource

        property :Path
        property :Policies
      end
    end
  end
end

