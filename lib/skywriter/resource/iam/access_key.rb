module Skywriter
  class Resource
    module IAM
      class AccessKey < Skywriter::Resource
        property :Serial
        property :Status
        property :UserName
      end
    end
  end
end

