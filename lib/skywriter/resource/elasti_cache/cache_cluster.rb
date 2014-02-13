module Skywriter
  class Resource
    module ElastiCache
      class CacheCluster < Skywriter::Resource
        property :AutoMinorVersionUpgrade
        property :CacheNodeType
        property :CacheParameterGroupName
        property :CacheSecurityGroupNames
        property :CacheSubnetGroupName
        property :ClusterName
        property :Engine
        property :EngineVersion
        property :NotificationTopicArn
        property :NumCacheNodes
        property :Port
        property :PreferredAvailabilityZone
        property :PreferredMaintenanceWindow
        property :SnapshotArns
        property :VpcSecurityGroupIds
      end
    end
  end
end
