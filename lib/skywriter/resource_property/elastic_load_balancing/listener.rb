module Skywriter
  class ResourceProperty
    module ElasticLoadBalancing
      class Listener < Skywriter::ResourceProperty
        property :InstancePort
        property :InstanceProtocol
        property :LoadBalancerPort
        property :PolicyNames
        property :Protocol
        property :SSLCertificateId
      end
    end
  end
end
