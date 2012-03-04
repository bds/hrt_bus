require 'spec_helper'

FactoryGirl.define do
  factory :rider, :class => HrtBus::Rider do
    id            {}
    time          {}
    lat           { "37.1787591" }
    lon           { "-76.50600070"}
    route_id      { SecureRandom.random_number(1e9.to_i).to_s }
    direction     { %w(inbound outbound).sample }
  end
end
