module Skywriter
  class ResourceProperty
    module CloudFront
      class ForwardedValue < Skywriter::ResourceProperty
        property :QueryString
      end

    ForwardedValues = ForwardedValue

    end
  end
end

