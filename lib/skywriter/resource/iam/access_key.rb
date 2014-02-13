module Skywriter
  module Resource
    module IAM
      class AccessKey
        include Skywriter::Resource

        property :Serial
        property :Status
        property :UserName
      end
    end
  end
end

