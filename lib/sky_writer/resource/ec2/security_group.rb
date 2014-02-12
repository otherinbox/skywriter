module SkyWriter
  class Resource
    module EC2
      class SecurityGroup < SkyWriter::Resource
        property :GroupDescription
        property :SecurityGroupEgress
        property :SecurityGroupIngress
        property :VpcId
        property :Tags
      end
    end
  end
end
