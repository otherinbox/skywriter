module Skywriter
  class ResourceProperty
    module Route53
      class AliasTarget < Skywriter::ResourceProperty
        property :HostedZoneId
        property :DNSName
      end

      AliasTargetPropertyType = AliasTarget
    end
  end
end
