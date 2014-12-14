require 'spec_helper'

describe Skywriter::Resource do
  let(:resource_class) do
    class Skywriter::Resource::TestResource
      include Skywriter::Resource

      property :FooBar
    end
    Skywriter::Resource::TestResource
  end

  let(:child_class) do
    class ChildClass < resource_class; end
    ChildClass
  end


  describe "#as_json" do
    it "serializes literal property values specified with snake case symbols" do
      resource = resource_class.new('resource name', foo_bar: 'value')

      expect(resource.as_json['resource name']['Properties']['FooBar']).to eq("value")
    end

    it "serializes literal property values specified with snake case strings" do
      resource = resource_class.new('resource name', 'foo_bar' => 'value')

      expect(resource.as_json['resource name']['Properties']['FooBar']).to eq("value")
    end

    it "serializes literal property values specified with CamelCase symbols" do
      resource = resource_class.new('resource name', FooBar: 'value')

      expect(resource.as_json['resource name']['Properties']['FooBar']).to eq("value")
    end

    it "serializes literal property values specified with CamelCase strings" do
      resource = resource_class.new('resource name', 'FooBar' => 'value')

      expect(resource.as_json['resource name']['Properties']['FooBar']).to eq("value")
    end

    it "sets type" do
      resource = resource_class.new('resource name', foo_bar: 'value')

      expect(resource.as_json['resource name']['Type']).to eq("AWS::TestResource")
    end

    it "sets type correctly in child classes" do
      resource = child_class.new('resource name', foo_bar: 'value')

      expect(resource.as_json['resource name']['Type']).to eq("AWS::TestResource")
    end

    it "sets additional dependencies" do
      resource = resource_class.new('resource name', additional_dependencies: 'value')

      expect(resource.as_json['resource name']['DependsOn']).to include('value')
    end

    it "sets depends on key if pointer passed" do
      reference = resource_class.new('reference')
      resource = resource_class.new('resource name', foo_bar: reference.as_pointer)

      expect(resource.as_json['resource name']['DependsOn']).to include('reference')
    end

    it "merges magical and additional depedencies" do
      reference = resource_class.new('reference')
      resource = resource_class.new('resource name', foo_bar: reference.as_pointer, additional_dependencies: ['depends on'])

      expect(resource.as_json['resource name']['DependsOn']).to include('reference')
      expect(resource.as_json['resource name']['DependsOn']).to include('depends on')
    end

    it "removes duplicate depedencies" do
      reference = resource_class.new('reference')
      resource = resource_class.new('resource name', foo_bar: reference.as_pointer, additional_dependencies: ['reference', 'reference'])

      expect(resource.as_json['resource name']['DependsOn']).to eq(['reference'])
    end

    it "creates a DeletionPolicy key" do
      resource = resource_class.new('resource name', foo_bar: 'x', deletion_policy: 'Retain')

      expect(resource.as_json['resource name']['DeletionPolicy']).to eq('Retain')
    end

    it "creates a Metadata key" do
      resource = resource_class.new('resource name', foo_bar: 'x', metadata: { foo: 'bar', baz: 'qux' })

      expect(resource.as_json['resource name']['Metadata']).to eq(foo: 'bar', baz: 'qux')
    end

    it "creates a UpdatePolicy key" do
      resource = resource_class.new(
        'resource name',
        foo_bar: 'x',
        update_policy: {
          AutoScalingRollingUpdate: {
            MinInstancesInService: "1",
            MaxBatchSize: "1",
            PauseTime: "PT12M5S"
          }
        },
      )

      expect(resource.as_json['resource name']['UpdatePolicy']).to eq(
        AutoScalingRollingUpdate: {
          MinInstancesInService: "1",
          MaxBatchSize: "1",
          PauseTime: "PT12M5S"
        }
      )
    end
  end

  describe "#register_dependency" do
    it "adds logical name to dependency list" do
      resource = resource_class.new('resource')
      resource.register_dependency(double(logical_name: 'logical name'))

      expect(resource.as_json['resource']['DependsOn']).to include('logical name')
    end
  end

  describe "#as_pointer" do
    context "with no args" do
      subject { resource_class.new('resource name').as_pointer }

      it "returns a reference" do
        expect(subject).to be_a(Skywriter::Resource::RefPointer)
      end
    end

    context "when asked for a ref" do
      subject { resource_class.new('resource name').as_pointer(with: :ref) }

      it "returns a logical name" do
        expect(subject).to be_a(Skywriter::Resource::RefPointer)
      end
    end

    context "when asked for a logical name" do
      subject { resource_class.new('resource name').as_pointer(with: :logical_name) }

      it "returns a logical name" do
        expect(subject).to be_a(Skywriter::Resource::LogicalNamePointer)
      end
    end
  end

  describe "#[]" do
    it "return the expected function" do
      resource = resource_class.new('resource')
      expect(resource[:PublicDnsName]).to eq({ "Fn::GetAtt" => ['resource', 'PublicDnsName'] })
    end
  end

  describe ".top_property" do
    let(:butts) do
      class Skywriter::Resource::TopProperty
        include Skywriter::Resource

        top_property :Butts
      end
      Skywriter::Resource::TopProperty
    end

    it "puts the top property as a peer of Type" do
      resource = butts.new('resource name', butts: '1.0')

      expect(resource.as_json['resource name']['Butts']).to eq('1.0')
    end
  end
end

describe "The implementation" do
  [
    Skywriter::Resource::AutoScaling::AutoScalingGroup,
    Skywriter::Resource::AutoScaling::LaunchConfiguration,
    Skywriter::Resource::AutoScaling::ScalingPolicy,
    Skywriter::Resource::AutoScaling::ScheduledAction,
    Skywriter::Resource::CloudFormation::Stack,
    Skywriter::Resource::CloudFormation::WaitConditionHandle,
    Skywriter::Resource::CloudFormation::WaitCondition,
    Skywriter::Resource::CloudFront::Distribution,
    Skywriter::Resource::CloudWatch::Alarm,
    Skywriter::Resource::DynamoDB::Table,
    Skywriter::Resource::EC2::CustomerGateway,
    Skywriter::Resource::EC2::DHCPOptions,
    Skywriter::Resource::EC2::EIPAssociation,
    Skywriter::Resource::EC2::EIP,
    Skywriter::Resource::EC2::Instance,
    Skywriter::Resource::EC2::InternetGateway,
    Skywriter::Resource::EC2::NetworkAclEntry,
    Skywriter::Resource::EC2::NetworkAcl,
    Skywriter::Resource::EC2::NetworkInterfaceAttachment,
    Skywriter::Resource::EC2::NetworkInterface,
    Skywriter::Resource::EC2::Route,
    Skywriter::Resource::EC2::RouteTable,
    Skywriter::Resource::EC2::SecurityGroup,
    Skywriter::Resource::EC2::SecurityGroupIngress,
    Skywriter::Resource::EC2::SecurityGroupEgress,
    Skywriter::Resource::EC2::SubnetNetworkAclAssociation,
    Skywriter::Resource::EC2::SubnetRouteTableAssociation,
    Skywriter::Resource::EC2::Subnet,
    Skywriter::Resource::EC2::VolumeAttachment,
    Skywriter::Resource::EC2::Volume,
    Skywriter::Resource::EC2::VPCDHCPOptionsAssociation,
    Skywriter::Resource::EC2::VPCGatewayAttachment,
    Skywriter::Resource::EC2::VPC,
    Skywriter::Resource::EC2::VPNConnectionRoute,
    Skywriter::Resource::EC2::VPNConnection,
    Skywriter::Resource::EC2::VPNGatewayRoutePropagation,
    Skywriter::Resource::EC2::VPNGateway,
    Skywriter::Resource::ElastiCache::CacheCluster,
    Skywriter::Resource::ElastiCache::ParameterGroup,
    Skywriter::Resource::ElastiCache::SecurityGroup,
    Skywriter::Resource::ElastiCache::SecurityGroupIngress,
    Skywriter::Resource::ElastiCache::SubnetGroup,
    Skywriter::Resource::ElasticBeanstalk::Application,
    Skywriter::Resource::ElasticBeanstalk::ApplicationVersion,
    Skywriter::Resource::ElasticBeanstalk::ConfigurationTemplate,
    Skywriter::Resource::ElasticBeanstalk::Environment,
    Skywriter::Resource::ElasticLoadBalancing::LoadBalancer,
    Skywriter::Resource::IAM::AccessKey,
    Skywriter::Resource::IAM::Group,
    Skywriter::Resource::IAM::InstanceProfile,
    Skywriter::Resource::IAM::Policy,
    Skywriter::Resource::IAM::Role,
    Skywriter::Resource::IAM::User,
    Skywriter::Resource::IAM::UserToGroupAddition,
    Skywriter::Resource::Redshift::Cluster,
    Skywriter::Resource::Redshift::ClusterParameterGroup,
    Skywriter::Resource::Redshift::ClusterSecurityGroup,
    Skywriter::Resource::Redshift::ClusterSecurityGroupIngress,
    Skywriter::Resource::Redshift::ClusterSubnetGroup,
    Skywriter::Resource::RDS::DBInstance,
    Skywriter::Resource::RDS::DBParameterGroup,
    Skywriter::Resource::RDS::DBSubnetGroup,
    Skywriter::Resource::RDS::DBSecurityGroup,
    Skywriter::Resource::RDS::DBSecurityGroupIngress,
    Skywriter::Resource::Route53::RecordSet,
    Skywriter::Resource::Route53::RecordSetGroup,
    Skywriter::Resource::S3::Bucket,
    Skywriter::Resource::S3::BucketPolicy,
    Skywriter::Resource::SDB::Domain,
    Skywriter::Resource::SNS::TopicPolicy,
    Skywriter::Resource::SNS::Topic,
    Skywriter::Resource::SQS::Queue,
    Skywriter::Resource::SQS::QueuePolicy
  ].each do |klass|
    context "of #{klass.name}" do
      it "is a resource" do
        expect(klass.new('name')).to be_a(Skywriter::Resource)
      end
    end
  end
end
