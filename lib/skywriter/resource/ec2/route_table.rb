module Skywriter
  module Resource
    module EC2
      # AWS::EC2::RouteTable Resource
      #
      class RouteTable
        include Skywriter::Resource

        property :VpcId
        property :Tags
      end
    end
  end
end
