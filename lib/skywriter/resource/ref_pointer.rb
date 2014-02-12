module Skywriter
  class Resource
    class RefPointer < Pointer
      private

      def json_fragment
        { "Ref" => resource.logical_name }
      end
    end
  end
end
