module Skywriter
  class Resource
    module RDS
      class DBInstance < Skywriter::Resource
        property :AllocatedStorage
        property :AutoMinorVersionUpgrade
        property :AvailabilityZone
        property :BackupRetentionPeriod
        property :DBInstanceClass
        property :DBInstanceIdentifier
        property :DBName
        property :DBParameterGroupName
        property :DBSecurityGroups
        property :DBSnapshotIdentifier
        property :DBSubnetGroupName
        property :Engine
        property :EngineVersion
        property :Iops
        property :LicenseModel
        property :MasterUsername
        property :MasterUserPassword
        property :MultiAZ
        property :Port
        property :PreferredBackupWindow
        property :PreferredMaintenanceWindow
        property :SourceDBInstanceIdentifier
        property :Tags
        property :VPCSecurityGroups
      end
    end
  end
end

