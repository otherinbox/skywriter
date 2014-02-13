module Skywriter
  module Resource
    module EC2
      class EIP
        include Skywriter::Resource

        property :InstanceId
        property :Domain
      end
    end
  end
end
