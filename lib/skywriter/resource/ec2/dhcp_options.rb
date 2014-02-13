module Skywriter
  module Resource
    module EC2
      class DHCPOptions
        include Skywriter::Resource

        property :DomainName
        property :DomainNameServers
        property :NetbiosNameServers
        property :NetbiosNodeType
        property :NtpServers
        property :Tags
      end
    end
  end
end
