module Skywriter
  class ResourceProperty
    module ElasticLoadBalancing
      class AppCookieStickinessPolicy < Skywriter::ResourceProperty
        property :CookieName
        property :PolicyName
      end

      AppCookieStickinessPolicyType = AppCookieStickinessPolicy
    end

    AppCookieStickinessPolicyType = ElasticLoadBalancing::AppCookieStickinessPolicy
    AppCookieStickiness = ElasticLoadBalancing::AppCookieStickinessPolicy
  end
end
