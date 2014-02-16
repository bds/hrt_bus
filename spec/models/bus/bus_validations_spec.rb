require 'spec_helper'
require 'factories/bus'

describe HrtBus::Bus do
  describe "validations" do

    let(:bus) { FactoryGirl.build(:bus) }

    it "should validate_presence_of :id" do
      bus.should be_valid
      bus.id = nil
      bus.should_not be_valid
      bus.errors.messages[:id].first.should match(/can't be blank/)
    end

    context "direction" do

      it "should validate_presence_of :direction" do
        bus.should be_valid
        bus.direction = nil
        bus.should_not be_valid
        bus.errors.messages[:direction].first.should match(/is not included in the list/)
      end

      it "should allow values inbound and outbound" do
        bus.should be_valid

        bus.direction = "inbound"
        bus.should be_valid

        bus.direction = "outbound"
        bus.should be_valid
      end

      it "should not allow values 1 or 2" do
        bus.should be_valid

        bus.direction = "1"
        bus.should_not be_valid

        bus.direction = "2"
        bus.should_not be_valid
      end

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

    it "should validate_presence_of :adherence" do
      bus.should be_valid
      bus.adherence = nil
      bus.should_not be_valid
      bus.errors.messages[:adherence].first.should match(/is not a number/)
    end

    it "should validate_numericality :adherence" do
      bus.should be_valid
      bus.adherence = "late"
      bus.should_not be_valid
      bus.errors.messages[:adherence].first.should match(/is not a number/)
    end

  end

end
