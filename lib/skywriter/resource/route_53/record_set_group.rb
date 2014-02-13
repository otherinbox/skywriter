module Skywriter
  class Resource
    module Route53
      class RecordSetGroup < Skywriter::Resource
        property :HostedZoneId
        property :HostedZoneName
        property :RecordSets
        property :Comment
      end
    end
  end
end

