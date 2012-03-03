require 'spec_helper'

FactoryGirl.define do
  factory :rider, :class => HrtBus::Rider do
    id            { SecureRandom.random_number(1e9.to_i) }
    time          { Time.now }
    lat           { 36.8042501 }
    lon           { -76.1018951 }
    route_id      { SecureRandom.random_number(1e9.to_i) }
  end
end
