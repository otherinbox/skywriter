module Skywriter
  module Resource
    class Pointer
      attr_reader :resource

      def initialize(resource)
        @resource = resource
      end

      def as_json
        context.register_dependency(resource) unless context.nil?

        return json_fragment
      end

      private

      def context
        Thread.current[:skywriter_as_json_context]
      end
    end
  end
end
