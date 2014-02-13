module Skywriter
  class Resource
    module IAM
      class Group < Skywriter::Resource
        property :Path
        property :Policies
      end
    end
  end
end

