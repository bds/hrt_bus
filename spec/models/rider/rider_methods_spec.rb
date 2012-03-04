require 'spec_helper'
require 'factories/rider'

describe HrtBus::Rider do

  describe "bus" do

    use_vcr_cassette

    describe "when the server responds with 226" do

      context "there are NO bus that match the riders route" do

        let(:bus) { Factory.build(:rider, :route_id => "999999", :direction => "inbound").bus }

        it "it should return nil" do
          bus.should be_nil
        end

      end

      context "there is one bus that matches the riders route" do

        let(:bus) { Factory.build(:rider, :route_id => "111", :direction => "outbound").bus }

        it "should return only one bus that matches the riders route" do
          bus.should be_a_kind_of(HrtBus::Bus)
          bus.should be_valid
          bus.route_id.should == "111"
          bus.direction.should == "outbound"
        end

      end

      context "there are outbound and inbound buses that match the riders route" do

        context "inbound" do

          let(:bus) { Factory.build(:rider, :route_id => "6", :direction => "inbound").bus }

          it "should return a inbound bus that matches the riders route" do
            bus.direction.should == "inbound"
            bus.should be_a_kind_of(HrtBus::Bus)
            bus.should be_valid
            bus.route_id.should == "6"
          end

        end

        context "outbound" do

          let(:bus) { Factory.build(:rider, :route_id => "6", :direction => "outbound").bus }

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
