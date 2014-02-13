module Skywriter
  module Resource
    module EC2
      class InternetGateway
        include Skywriter::Resource

        property :Tags
      end
    end
  end
end
