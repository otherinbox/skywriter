require 'spec_helper'

describe Skywriter::Resource::ElastiCache::CacheCluster do
  it "is a Resource" do
    expect(Skywriter::Resource::ElastiCache::CacheCluster.new('name')).to be_a(Skywriter::Resource)
  end
end
