module SkyWriter
  class Resource
    module EC2
      class SecurityGroup < SkyWriter::Resource
        property :GroupDescription
        property :SecurityGroupIngress, type: :array
        property :VpcId
      end
    end
  end
end
