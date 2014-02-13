module Skywriter
  class ResourceProperty
    module ElasticLoadBalancing
      class AppCookieStickinessPolicy < Skywriter::ResourceProperty
        property :CookieName
        property :PolicyName
      end
    end
  end
end
