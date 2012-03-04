require 'spec_helper'
require 'factories/rider'

describe HrtBus::Rider do
  describe "validations" do

    let(:rider) { Factory.build(:rider) }

    it "should validate_presence_of :time" do
      rider.should be_valid
      rider.time = nil
      rider.should_not be_valid
      rider.errors.messages[:time].first.should match(/can't be blank/)
    end

    it "should validate_presence_of :lat" do
      rider.should be_valid
      rider.lat = nil
      rider.should_not be_valid
      rider.errors.messages[:lat].first.should match(/is not a number/)
    end

    it "should validate_presence_of :lon" do
      rider.should be_valid
      rider.lon = nil
      rider.should_not be_valid
      rider.errors.messages[:lon].first.should match(/is not a number/)
    end

    it "should validate_presence_of :route_id" do
      rider.should be_valid
      rider.route_id = nil
      rider.should_not be_valid
      rider.errors.messages[:route_id].first.should match(/is not a number/)
    end

  end

end

