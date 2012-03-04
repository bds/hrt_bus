require 'spec_helper'
require 'factories/rider'

describe HrtBus::Rider do

  describe "bus" do

    use_vcr_cassette

    context "when the server responds with 226" do

      context "when there are NO bus that match the riders route" do

        let(:bus) { Factory.build(:rider, :route_id => "999999").bus }

        it "it should return nil" do
          bus.should be_nil
        end

      end

      context "when there is only one bus that matches the riders route" do

        let(:bus) { Factory.build(:rider, :route_id => "6").bus }

        it "should return only one bus that matches the riders route" do
          bus.should be_a_kind_of(HrtBus::Bus)
          bus.should be_valid
          bus.route_id.should == "6"
        end

      end

      context "when there are more than one bus that matches the riders route" do

        let(:bus) { Factory.build(:rider, :route_id => "111").bus }

        it "should return only one bus that matches the riders route" do
          bus.should be_a_kind_of(HrtBus::Bus)
          bus.should be_valid
          bus.route_id.should == "111"
        end

      end

    end

  end

end
