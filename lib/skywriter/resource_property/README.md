# ResourceProperty Conversions

The AWS CloudFormation documentation uses inconsistent naming conventions
for Resource Properties.  We've attempted to normalize these names, and have 
provided the following mapping for reference.

Amazon Name | Skywalker Class | Naming Comments 
----------- | --------------- | --------------- 
AWS CloudFormation AutoScaling Block Device Mapping Property Type | |
AWS CloudFormation AutoScaling EBS Block Device Property Type | |
Auto Scaling NotificationConfiguration Property Type | |
Auto Scaling Tags Property Type | |
CloudFormation Stack Parameters Property Type | |
CloudFront CacheBehavior Type | |
CloudFront ForwardedValues Type | |
CloudFront CustomOrigin Type | *::CloudFront::CustomOrigin | dropped 'Type' 
CloudFront DefaultCacheBehavior Type | *::CloudFront::DefaultCacheBehavior | dropped 'Type' 
CloudFront DistributionConfig Type | *::CloudFront::DistributionConfig | dropped 'Type' 
CloudFront Logging Type | *::CloudFront::Logging | dropped 'Type' 
CloudFront Origin Type | *::CloudFront::Origin | dropped 'Type' 
CloudFront S3Origin Type | *::CloudFront::S3Origin | dropped 'Type' 
CloudWatch Metric Dimension Property Type | *::CloudWatch::MetricDimension | dropped 'Property Type' 
DynamoDB Attribute Definitions | *::DynamoDB::AttributeDefinition | 
DynamoDB Global Secondary Indexes | *::DynamoDB::GlobalSecondaryIndex | made singular 
DynamoDB Key Schema | *::DynamoDB::KeySchema | 
DynamoDB Local Secondary Indexes | *::DynamoDB::LocalSecondaryIndex | made singular 
DynamoDB Projection Object | *::DynamoDB::Projection | dropped 'Object' 
DynamoDB Provisioned Throughput | *::DynamoDB::ProvisionedThroughput | 
AWS CloudFormation EC2 Block Device Mapping Property Type | *::EC2::BlockDeviceMapping | dropped 'Type' 
AWS CloudFormation EC2 Block Device Property Type | *::EC2::EBSBlockDevice | dropped 'Type' 
EC2 ICMP Property Type | *::EC2::ICMP | dropped 'Type' 
EC2 MountPoint Property Type | *::EC2::MountPoint | dropped 'Type' 
EC2 NetworkInterface Embedded Property Type | *::EC2::NetworkInterface | dropped 'Type' 
EC2 Network Interface Association | *::EC2::NetworkInterfaceAssociation | 
EC2 Network Interface Attachment | *::EC2::NetworkInterfaceAttachment | 
EC2 Network Interface Group Item | *::EC2::NetworkInterfaceGroupItem | 
EC2 Network Interface Private IP Specification | *::EC2::NetworkInterfacePrivateIPSpecification | 
EC2 PortRange Property Type | *::EC2::PortRange | dropped 'Type' 
EC2 Security Group Rule Property Type | *::EC2::SecurityGroupRule | dropped 'Type' 
EC2 Tag | *::EC2::Tag | 
AWS Elastic Beanstalk Environment Tier Property Type | *::ElasticBeanstalk::EnvironmentTier | dropped 'Property Type' 
AWS Elastic Beanstalk OptionSettings Property Type | *::ElasticBeanstalk::OptionSetting | dropped 'Property Type', made singular
AWS Elastic Beanstalk SourceBundle Property Type | *::ElasticBeanstalk::SourceBundle | dropped 'Property Type' 
AWS Elastic Beanstalk SourceConfiguration Property Type | *::ElasticBeanstalk::SourceConfiguration | dropped 'Property Type' 
ElasticLoadBalancing AppCookieStickinessPolicy Type | *::ElasticLoadBalancing::AppCookieStickinessPolicy | dropped 'Type' 
ElasticLoadBalancing HealthCheck Type | *::ElasticLoadBalancing::HealthCheck | dropped 'Type' 
ElasticLoadBalancing LBCookieStickinessPolicy Type | *::ElasticLoadBalancing::LBCookieStickinessPolicy | dropped 'Type' 
ElasticLoadBalancing Listener Property Type | *::ElasticLoadBalancing::Listener | dropped 'Property Type' 
ElasticLoadBalancing Policy Type | *::ElasticLoadBalancing::Policy | dropped 'Type' 
Name Type | | 
Amazon Redshift Parameter Type | *::Redshift::Parameter | dropped 'Type' 
AWS CloudFormation Resource Tags Type | *::CloudFormation::ResourceTag | dropped 'Type', made singular
RDS Security Group Rule | *::RDS::SecurityGroupRule | 
Route 53 AliasTarget Property Type | *::Route53::AliasTarget | dropped 'Property Type' 
AWS CloudFormation Website Configuration Property Type | *::S3::WebsiteConfiguration | dropped 'Property Type', inferred namespace 
SNS Subscription Property Type | *::SNS::Subscription | dropped 'Property Type' 
Amazon SQS RedrivePolicy | *::SQS::RedrivePolicy | 

In general, Resource Property names have been stripped of `Type`, `Property Type` and 
'Embedded Property Type', and product namespaces (ie `SQS`, `ElasticLoadBalancing`) 
have been inferred from the documentation where possible.  When a type is called out 
as being an 'embedded property' of namespaced resource, that namespace has been adopted for
the Resource Property. In some cases plural forms have been made singular (where the 
entity being described is singular).
