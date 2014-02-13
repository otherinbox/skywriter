module Skywriter
  module Resource
    module IAM
      class Group
        include Skywriter::Resource

        property :Path
        property :Policies
      end
    end
  end
end

