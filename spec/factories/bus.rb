require 'spec_helper'

FactoryGirl.define do
  factory :bus, :class => HrtBus::Bus do
    id            { SecureRandom.random_number(1e9.to_i) }
    time          { Time.now }
    lat           { 36.8642501 }
    lon           { -76.2818951 }
    route_id      { SecureRandom.random_number(1e9.to_i) }
    direction     { %w(inbound outbound).sample }
  end
end
