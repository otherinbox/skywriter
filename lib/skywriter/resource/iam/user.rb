module Skywriter
  class Resource
    module IAM
      class User < Skywriter::Resource
        property :Path
        property :Groups
        property :LoginProfile
        property :Policies
      end
    end
  end
end

