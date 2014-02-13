module Skywriter
  class ResourceProperty
    module S3
      class WebsiteConfigurationPolicy < Skywriter::ResourceProperty
        property :IndexDocument
        property :ErrorDocument
      end
    end
  end
end
