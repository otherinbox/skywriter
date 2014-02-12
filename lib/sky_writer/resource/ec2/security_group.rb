module SkyWriter
  class Resource
    module EC2
      class SecurityGroup < SkyWriter::Resource
        property :GroupDescription
        property :SecurityGroupIngress, convert: :to_a
        property :VpcId
      end
    end
  end
end
