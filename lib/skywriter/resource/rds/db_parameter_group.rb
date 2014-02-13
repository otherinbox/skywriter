module Skywriter
  class Resource
    module RDS
      class DBParameterGroup < Skywriter::Resource
        property :Description
        property :Family
        property :Parameters
        property :Tags
      end
    end
  end
end

