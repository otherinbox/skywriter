module Skywriter
  class Resource
    module IAM
      class InstanceProfile < Skywriter::Resource
        property :Path
        property :Roles
      end
    end
  end
end

