module Skywriter
  class Resource
    module IAM
      class Policy < Skywriter::Resource
        property :Groups
        property :PolicyDocument
        property :PolicyName
        property :Roles
        property :Users
      end
    end
  end
end

