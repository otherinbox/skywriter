module Skywriter
  module Resource
    module ElastiCache
      # AWS::ElastiCache::CacheCluster Resource
      # 
      class CacheCluster
        include Skywriter::Resource

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
