module Skywriter
  module Resource
    module EC2
      # AWS::EC2::EIP Resource
      #
      class EIP
        include Skywriter::Resource

        property :InstanceId
        property :Domain
      end
    end
  end
end
