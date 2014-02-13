module Skywriter
  module Resource
    module Route53
      class RecordSetGroup
        include Skywriter::Resource

        property :HostedZoneId
        property :HostedZoneName
        property :RecordSets
        property :Comment
      end
    end
  end
end

