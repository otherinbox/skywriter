module Skywriter
  class ResourceProperty
    module ElasticLoadBalancing
      class LBCookieStickinessPolicy < Skywriter::ResourceProperty
        property :CookieExpirationPeriod
        property :PolicyName
      end
    end
  end
end
