imodule Skywriter
  class ResourceProperty
    module CloudFront
      class ForwardedValue < Skywriter::ResourceProperty
        property :QueryString
      end
    end

    ForwardedValues = ForwardedValue

  end
end

