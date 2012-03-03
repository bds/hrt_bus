require 'spec_helper'
require 'factories/bus'

describe HrtBus::Bus do

  describe "active_buses" do
    use_vcr_cassette

    context "when the server responds with 226" do
      let(:buses) { HrtBus::Bus.active_buses }

      it "should return a collection of valid buses" do
        buses.should be_a_kind_of(Enumerable) 
        buses.each { |bus| bus.should be_valid }
        buses.first.should be_a_kind_of(HrtBus::Bus) 
      end

    end

  end

  describe "all" do
    use_vcr_cassette

    context "when the server responds with 226" do
      let(:buses) { HrtBus::Bus.all }

      it "should return a collection of all buses" do
        buses.should be_a_kind_of(Enumerable)
        buses.count.should > 200
        buses.first.should be_a_kind_of(HrtBus::Bus)
      end

    end

  end

  describe "static_map" do
    use_vcr_cassette
    let(:bus) { Factory.build(:bus) }

    it "should return a string of bytes" do
      bus.static_map.should be_a_kind_of(String)
    end

  end
end
