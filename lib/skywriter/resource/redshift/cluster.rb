module Skywriter
  class Resource
    module Redshift
      class Cluster < Skywriter::Resource
        property :AllowVersionUpgrade
        property :AutomatedSnapshotRetentionPeriod
        property :AvailabilityZone
        property :ClusterParameterGroupName
        property :ClusterSecurityGroups
        property :ClusterSubnetGroupName
        property :ClusterType
        property :ClusterVersion
        property :DBName
        property :ElasticIp
        property :Encrypted
        property :HsmClientCertificationIdentifier
        property :HsmConfigurationIdentifier
        property :MasterUsername
        property :MasterUserPassword
        property :NodeType
        property :NumberOfNodes
        property :OwnerAccount
        property :Port
        property :PreferredMaintenanceWindow
        property :PubliclyAccessible
        property :SnapshotClusterIdentifier
        property :SnapshotIdentifier
        property :VpcSecurityGroupIds
      end
    end
  end
end

