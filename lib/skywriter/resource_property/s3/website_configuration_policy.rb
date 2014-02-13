module Skywriter
  class ResourceProperty
    module S3
      class WebsiteConfiguration < Skywriter::ResourceProperty
        property :IndexDocument
        property :ErrorDocument
      end
    end

    # This attribute looks like it should be in the 'CloudFormation' namespace, but it's actually
    # and embedded property of a resource in the 'S3' namespace
    module CloudFormation
      WebsiteConfiguration = ::Skywriter::ResourceProperty::S3::WebsiteConfiguration
    end
  end
end
