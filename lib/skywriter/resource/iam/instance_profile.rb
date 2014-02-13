module Skywriter
  module Resource
    module IAM
      class InstanceProfile
        include Skywriter::Resource

        property :Path
        property :Roles
      end
    end
  end
end

