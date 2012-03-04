require 'spec_helper'

FactoryGirl.define do
  factory :rider, :class => HrtBus::Rider do
    id            {}
    time          {}
    lat           {}
    lon           {}
    route_id      { SecureRandom.random_number(1e9.to_i).to_s }
    direction     { %w(inbound outbound).sample }
  end
end
