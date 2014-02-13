module Skywriter
  class Resource
    module EC2
      class EIP < Skywriter::Resource
        property :InstanceId
        property :Domain
      end
    end
  end
end
