require 'spec_helper'
require 'factories/rider'

describe HrtBus::Rider do
  describe "validations" do

    let(:rider) { Factory.build(:rider) }

    it "should validate_presence_of :route_id" do
      rider.should be_valid
      rider.route_id = nil
      rider.should_not be_valid
      rider.errors.messages[:route_id].first.should match(/is not a number/)
    end

  end

end

