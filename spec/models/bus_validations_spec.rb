require 'spec_helper'
require 'factories/bus'

describe HrtBus::Bus do
  describe "validations" do

    let(:bus) { Factory.build(:bus) }

    it "should validate_presence_of :id" do
      bus.should be_valid
      bus.id = nil
      bus.should_not be_valid
      bus.errors.messages[:id].first.should match(/can't be blank/)
    end

    it "should validate_presence_of :time" do
      bus.should be_valid
      bus.time = nil
      bus.should_not be_valid
      bus.errors.messages[:time].first.should match(/can't be blank/)
    end

    it "should validate_presence_of :lat" do
      bus.should be_valid
      bus.lat = nil
      bus.should_not be_valid
      bus.errors.messages[:lat].first.should match(/is not a number/)
    end

    it "should validate_presence_of :lon" do
      bus.should be_valid
      bus.lon = nil
      bus.should_not be_valid
      bus.errors.messages[:lon].first.should match(/is not a number/)
    end

    it "should validate_presence_of :route_id" do
      bus.should be_valid
      bus.route_id = nil
      bus.should_not be_valid
      bus.errors.messages[:route_id].first.should match(/is not a number/)
    end

  end

end
