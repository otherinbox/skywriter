module Skywriter
  class Resource
    class RefPointer < Pointer
      private

      def json_fragment
        Skywriter::Function.ref(resource.logical_name)
      end
    end
  end
end
