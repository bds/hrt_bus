require 'spec_helper'
require 'factories/rider'

describe HrtBus::Rider do

  describe "distance_to_bus" do
    use_vcr_cassette

    describe "when there is a bus for the Riders route" do

      before do
         @rider = FactoryGirl.build(:rider, :route_id => "111", :direction => "outbound")
         @bus   = @rider.bus
      end

      it "should return the distance to a bus in miles" do
        distance = Haversine.distance(@rider.lat.to_f, @rider.lon.to_f, @bus.lat.to_f, @bus.lon.to_f)
        distance.to_miles.should == @rider.distance_to_bus
      end

    end

    describe "when there is NOT a bus for the Riders route" do
      use_vcr_cassette

      before do
         @rider = FactoryGirl.build(:rider, :route_id => "50000", :direction => "outbound")
         @bus   = @rider.bus
      end

      it "should return 999999999" do
        @rider.distance_to_bus.should == 999999999
      end

    end

  end

  describe "bus" do
    use_vcr_cassette

    describe "when the server responds with 226" do

      context "when there are NO bus that match the riders route" do

        let(:bus) { FactoryGirl.build(:rider, :route_id => "999999", :direction => "inbound").bus }

        it "should return nil" do
          bus.should be_nil
        end

      end

      context "when a bus matches a riders route and is greater than 3 miles away" do

        before { @rider = FactoryGirl.build(:rider, :route_id => "6", :direction => "inbound") }
        let(:bus) { @rider.bus }

        it "should match the riders route" do
          bus.should be_a_kind_of(HrtBus::Bus)
          bus.should be_valid
          bus.route_id.should == "6"
          bus.direction.should == "inbound"
        end

        it "should be greater than 3 miles from the riders location" do
          @rider.distance_to_bus.should > 3
        end

      end

      context "when a bus matches the riders route and is nearer than 3 miles" do

        before { @rider = FactoryGirl.build(:rider, :route_id => "111", :direction => "outbound") }
        let(:bus) { @rider.bus }

        it "should match the riders route" do
          bus.should be_a_kind_of(HrtBus::Bus)
          bus.should be_valid
          bus.route_id.should == "111"
          bus.direction.should == "outbound"
        end

        it "should be within 3 miles of the riders location " do
          bus.should be_a_kind_of(HrtBus::Bus)
          @rider.distance_to_bus.should <= 3
        end

      end

      context "there are outbound and inbound buses that match the riders route" do

        context "inbound" do

          let(:bus) { FactoryGirl.build(:rider, :route_id => "6", :direction => "inbound").bus }

          it "should return a inbound bus that matches the riders route" do
            bus.direction.should == "inbound"
            bus.should be_a_kind_of(HrtBus::Bus)
            bus.should be_valid
            bus.route_id.should == "6"
          end

        end

        context "outbound" do

          let(:bus) { FactoryGirl.build(:rider, :route_id => "6", :direction => "outbound").bus }

          it "should return a outbound bus that matches the riders route" do
            bus.direction.should == "outbound"
            bus.should be_a_kind_of(HrtBus::Bus)
            bus.should be_valid
            bus.route_id.should == "6"
          end

        end

      end

    end

  end

end
