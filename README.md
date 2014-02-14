# Skywriter
[![Build Status](https://travis-ci.org/otherinbox/skywriter.png?branch=master)](https://travis-ci.org/otherinbox/skywriter)
[![Code Climate](https://codeclimate.com/github/otherinbox/skywriter.png)](https://codeclimate.com/github/otherinbox/skywriter)

Skywriter makes writing CloudFormation templates easier.

Writing and, more importantly, maintaining large JSON files can be a real pain.
Skywriter aims to alleviate some of that pain by letting you use code to
generate the JSON and, instead, maintain a Ruby file. Defining your template in
runnable code provides some benefits like variable assignment, that make the
need to use CloudFormation's build-in functions superfluous (of course,
Skywriter still has helpers for those functions, if you need them).


## Features

### Automatic Dependencies

When you are creating a resource, references to other resources will be added to
the `DependsOn` key automatically. If you have additional dependencies which
should be included in this key, they can be declared like this:

``` ruby
Resource.new(
  "ResourceName", 
  additional_dependencies: ['foo', 'bar'],
  some_property: other_resource.as_pointer,
).as_json 
  
# yields:
# { "ResourceName" => {
#   "Parameters" => {
#     "SomeProperty" => {"Ref" => "OtherResource"}
#   },
#   "DependsOn" => ["foo", "bar", "OtherResource"]
# }}
```

See the example section below for some more concrete examples.


## Examples

This example will build a basic VPC with an Internet Gateway. It uses a pointer to reference the VpcId in the Gateway Attachment resource.
It then creates a Cloudformation template from the resources.

``` ruby
my_vpc = Skywriter::Resource::EC2::VPC.new(
  "myVPC", 
  cidr_block: "10.10.0.0/16", 
  tags: { network: "public" }
)

my_igw = Skywriter::Resource::EC2::InternetGateway.new(
  "myInternetGateway", 
  tags: { network: "public" }
)

my_gateway_attachment = Skywriter::Resource::EC2::VPCGatewayAttachment.new(
  "myGatewayAttachment", 
  vpc_id: my_vpc.as_pointer
)

Skywriter::Template.new(
  description: "This is a test template",
  resources: [my_vpc, my_igw, my_gateway_attachment]
).as_json
```


Here we create an EC2 security group that is accessible on ports 80 and 22. The ec2 security group is added into the ingress for a database security group by using a pointer that references the logical name of the resource.
The new database security group, as well as an old one that already exists in our account, are both applied to a database instance resource.

``` ruby
my_ec2_sg = Skywriter::Resource::EC2::SecurityGroup.new(
  "ec2_security_group"
  GroupDescription: "a security group for my ec2 instances"
  SecurityGroupIngress: [
    Skywriter::ResourceProperty::EC2::SecurityGroupRule.new(FromPort: 80, ToPort: 80 IpProtocol: "tcp"], 
    Skywriter::ResourceProperty::EC2::SecurityGroupRule.new(FromPort: 22, ToPort: 22 IpProtocol: "tcp"] )
)

my_db_sg = Skywriter::Resource::RDS::DBSecurityGroup.new(
  "database_security_group",
  DBSecurityGroupIngress: Skywriter::ResourceProperty::RDS::SecurityGroupRule.new(EC2SecurityGroupName: ec2_sg.as_pointer(with :logical_name)
)

my_db = Skywriter::Resource::RDS::DBInstance.new(
  "mysql_database", 
  allocated_ storage: 5,
  availability_zone: "us-east-1a",
  db_name: "my_db",
  engine: "MySQL", 
  db_security_groups: ["old_sg", my_db_sg.as_pointer]
)
```




## Contributing

Help is gladly welcomed. If you have a feature you'd like to add, it's much more
likely to get in (or get in faster) the closer you stick to these steps:

1. Open an Issue to talk about it. We can discuss whether it's the right
  direction or maybe help track down a bug, etc.
1. Fork the project, and make a branch to work on your feature/fix. Master is
  where you'll want to start from.
1. Turn the Issue into a Pull Request. There are several ways to do this, but
  [hub](https://github.com/defunkt/hub) is probably the easiest.
1. Make sure your Pull Request includes tests.
1. Bonus points if your Pull Request updates `CHANGES.md` to include a summary
   of your changes and your name like the other entries. If the last entry is
   the last release, add a new `## Unreleased` heading.

If you don't know how to fix something, even just a Pull Request that includes a
failing test can be helpful. If in doubt, make an Issue to discuss.


## Copyright

Copyright © 2014 Return Path.

This gem is distributed under the MIT License. See [LICENSE.md](LICENSE.md) for
details.
