require 'spec_helper'
require 'factories/rider'

describe HrtBus::Rider do

  describe "buses" do

    use_vcr_cassette

    context "when the server responds with 226" do

      context "when there are buses that match the riders route" do

        let(:buses) { Factory.build(:rider, :route_id => "20").buses }

        it "should return a collection of buses that match the riders route" do

          buses.count.should >= 1

          buses.each do |bus|
            bus.should be_a_kind_of(HrtBus::Bus)
            bus.should be_valid
            bus.route_id.should == "20"
          end
        end

      end

      context "when there are NO buses that match the riders route" do

        let(:buses) { Factory.build(:rider, :route_id => "999999").buses }

        it "it should return an empty collection" do
          buses.should be_kind_of(Enumerable)
          buses.count.should == 0
        end

      end

    end

  end

end
