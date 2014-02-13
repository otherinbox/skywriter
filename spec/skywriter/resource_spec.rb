require 'spec_helper'

describe Skywriter::Resource do
  let(:resource_class) do
    Class.new(Skywriter::Resource) do
      property :FooBar

    end.tap do |klass|
      def klass.name
        "Skywriter::Resource::TestResource"
      end
    end
  end

  describe "#as_json" do
    it "serializes literal property values" do
      resource = resource_class.new('resource name', foo_bar: 'value')

      expect(resource.as_json['resource name']['Properties']['FooBar']).to eq("value")
    end

    it "sets type" do
      resource = resource_class.new('resource name', foo_bar: 'value')

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
end

describe "The implementation" do
  [
    Skywriter::Resource::AutoScaling::AutoScalingGroup,
    Skywriter::Resource::AutoScaling::LaunchConfiguration,
    Skywriter::Resource::AutoScaling::ScalingPolicy,
    Skywriter::Resource::AutoScaling::ScheduledAction,
    Skywriter::Resource::AutoScaling::Trigger,
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
    Skywriter::Resource::EC2::SecurityGroupEgress,
    Skywriter::Resource::EC2::SecurityGroupIngress,
    Skywriter::Resource::EC2::SecurityGroup,
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
  ].each do |klass|
    context "of #{klass.name}" do
      it "is a resource" do
        expect(klass.new('name')).to be_a(Skywriter::Resource)
      end
    end
  end
end
