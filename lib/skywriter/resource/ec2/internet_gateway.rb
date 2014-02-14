module Skywriter
  module Resource
    module EC2
      # AWS::EC2::InternetGateway Resource
      #
      class InternetGateway
        include Skywriter::Resource

        property :Tags
      end
    end
  end
end
