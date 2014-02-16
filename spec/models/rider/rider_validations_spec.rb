require 'spec_helper'
require 'factories/rider'

describe HrtBus::Rider do
  describe "validations" do

    let(:rider) { FactoryGirl.build(:rider) }

    it "should validate_presence_of :route_id" do
      rider.should be_valid
      rider.route_id = nil
      rider.should_not be_valid
      rider.errors.messages[:route_id].first.should match(/is not a number/)
    end

    context "direction" do

      it "should validate_presence_of :direction" do
        rider.should be_valid
        rider.direction = nil
        rider.should_not be_valid
        rider.errors.messages[:direction].first.should match(/is not included in the list/)
      end

      it "should allow values inbound and outbound" do
        rider.should be_valid

        rider.direction = "inbound"
        rider.should be_valid

        rider.direction = "outbound"
        rider.should be_valid
      end

      it "should not allow values 1 or 2" do
        rider.should be_valid

        rider.direction = "1"
        rider.should_not be_valid

        rider.direction = "2"
        rider.should_not be_valid
      end

    end

  end

end
