module Skywriter
  module Resource
    module Route53
      class RecordSet
        include Skywriter::Resource

        property :AliasTarget
        property :Comment
        property :HostedZoneId
        property :HostedZoneName
        property :Name
        property :Region
        property :ResourceRecords
        property :SetIdentifier
        property :TTL
        property :Type
        property :Weight
      end
    end
  end
end

