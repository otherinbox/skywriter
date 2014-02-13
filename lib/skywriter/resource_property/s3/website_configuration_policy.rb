module Skywriter
  class ResourceProperty
    module S3
      class WebsiteConfigurationPolicy < Skywriter::ResourceProperty
        property :IndexDocument
        property :ErrorDocument
      end

      WebsiteConfigurationPropertyType = WebsiteConfigurationPolicy
    end

    # This attribute looks like it should be in the 'CloudFormation' namespace, but it's actually
    # and embedded property of a resource in the 'S3' namespace
    module CloudFormation
      AWSCloudFormationWebsiteConfigurationPropertyType = ::Skywriter::ResourceProperty::S3::WebsiteConfigurationPolicy
      AWSCloudFormationWebsiteConfiguration = ::Skywriter::ResourceProperty::S3::WebsiteConfigurationPolicy
      WebsiteConfigurationPropertyType = ::Skywriter::ResourceProperty::S3::WebsiteConfigurationPolicy
    end

    AWSCloudFormationWebsiteConfigurationPropertyType = S3::WebsiteConfigurationPolicy
    AWSCloudFormationWebsiteConfiguration = S3::WebsiteConfigurationPolicy
  end
end
