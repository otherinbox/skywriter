module Skywriter
  module Resource
    module RDS
      class DBParameterGroup
        include Skywriter::Resource

        property :Description
        property :Family
        property :Parameters
        property :Tags
      end
    end
  end
end

