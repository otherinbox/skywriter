module SkyWriter
  class Resource
    module EC2
      class SecurityGroup < SkyWriter::Resource
        property :GroupDescription
        property :SecurityGroupIngress
      end
    end
  end
end
