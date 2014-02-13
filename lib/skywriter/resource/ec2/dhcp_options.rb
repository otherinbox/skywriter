module Skywriter
  class Resource
    module EC2
      class DHCPOptions < Skywriter::Resource
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
