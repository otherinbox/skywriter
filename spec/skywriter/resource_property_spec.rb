require 'spec_helper'

describe Skywriter::ResourceProperty do
  let(:resource_property_class) do
    Class.new(Skywriter::ResourceProperty) do
      property :FooBar
      property :BazQux
    end
  end

  describe "#as_json" do
    context "with missing properties" do
      subject { resource_property_class.new(foo_bar: '1').as_json }

      it "includes present properties" do
        expect(subject).to have_key('FooBar')
      end

      it "excludes missing properties" do
        expect(subject).to_not have_key('BazQux')
      end
    end

    context "with nil properties" do
      subject { resource_property_class.new(foo_bar: '1', baz_qux: nil).as_json }

      it "includes present properties" do
        expect(subject).to have_key('FooBar')
      end

      it "excludes nil properties" do
        expect(subject).to_not have_key('BazQux')
      end
    end
  end

  describe "implementations" do
    [
      Skywriter::ResourceProperty::CloudFront::CustomOrigin,
      Skywriter::ResourceProperty::CloudFront::DefaultCacheBehavior,
      Skywriter::ResourceProperty::CloudFront::DistributionConfig,
      Skywriter::ResourceProperty::CloudFront::Logging,
      Skywriter::ResourceProperty::CloudFront::Origin,
      Skywriter::ResourceProperty::CloudFront::S3Origin,
      Skywriter::ResourceProperty::CloudWatch::MetricDimension,
      Skywriter::ResourceProperty::DynamoDB::AttributeDefinition,
      Skywriter::ResourceProperty::DynamoDB::GlobalSecondaryIndex,
      Skywriter::ResourceProperty::DynamoDB::KeySchema,
      Skywriter::ResourceProperty::DynamoDB::LocalSecondaryIndex,
      Skywriter::ResourceProperty::DynamoDB::Projection,
      Skywriter::ResourceProperty::DynamoDB::ProvisionedThroughput,
      Skywriter::ResourceProperty::EC2::BlockDeviceMapping,
      Skywriter::ResourceProperty::EC2::EBSBlockDevice,
      Skywriter::ResourceProperty::EC2::ICMP,
      Skywriter::ResourceProperty::EC2::MountPoint,
      Skywriter::ResourceProperty::EC2::NetworkInterface,
      Skywriter::ResourceProperty::EC2::NetworkInterfaceAssociation,
      Skywriter::ResourceProperty::EC2::NetworkInterfaceAttachment,
      Skywriter::ResourceProperty::EC2::NetworkInterfaceGroupItem,
      Skywriter::ResourceProperty::EC2::NetworkInterfacePrivateIPSpecification,
      Skywriter::ResourceProperty::EC2::PortRange,
      Skywriter::ResourceProperty::EC2::SecurityGroupRule,
      Skywriter::ResourceProperty::EC2::Tag,
      Skywriter::ResourceProperty::ElasticBeanstalk::EnvironmentTier,
      Skywriter::ResourceProperty::ElasticBeanstalk::OptionSettings,
      Skywriter::ResourceProperty::ElasticBeanstalk::SourceBundle,
      Skywriter::ResourceProperty::ElasticBeanstalk::SourceConfiguration,
      Skywriter::ResourceProperty::ElasticLoadBalancing::AppCookieStickinessPolicy,
      Skywriter::ResourceProperty::ElasticLoadBalancing::HealthCheck,
      Skywriter::ResourceProperty::ElasticLoadBalancing::LBCookieStickinessPolicy,
      Skywriter::ResourceProperty::ElasticLoadBalancing::Listener,
      Skywriter::ResourceProperty::ElasticLoadBalancing::Policy,
      Skywriter::ResourceProperty::Redshift::Parameter,
      Skywriter::ResourceProperty::CloudFormation::ResourceTags,
      Skywriter::ResourceProperty::RDS::SecurityGroupRule,
      Skywriter::ResourceProperty::Route53::AliasTarget,
      Skywriter::ResourceProperty::S3::WebsiteConfigurationPolicy,
      Skywriter::ResourceProperty::SNS::Subscription,
      Skywriter::ResourceProperty::SQS::RedrivePolicy,
    ].each do |klass|
      context "with #{klass.name}" do
        it "inherits from resource property" do
          expect(klass.new).to be_a(Skywriter::ResourceProperty)
        end
      end
    end
  end
end
