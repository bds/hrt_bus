require 'spec_helper'
require 'factories/bus'

describe HrtBus::Bus do

  describe "active_buses" do
    use_vcr_cassette

    context "when the server responds with 226" do
      let(:buses) { HrtBus::Bus.active_buses }

      it "should return a collection of valid buses" do
        buses.should be_a_kind_of(Enumerable) 
        buses.should_not be_empty
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
    let(:bus) { FactoryGirl.build(:bus) }

    it "should return a string of bytes" do
      bus.static_map.should be_a_kind_of(String)
    end

  end

  describe "early?" do

    context "the bus is early" do
      it "should return true" do
        bus = FactoryGirl.build(:bus, :adherence => -2)
        bus.early?.should be_true
      end
    end

    context "the bus is on time" do
      it "should return false" do
        bus = FactoryGirl.build(:bus, :adherence => 0)
        bus.early?.should be_false
      end
    end

    context "the bus is late" do
      it "should return false" do
        bus = FactoryGirl.build(:bus, :adherence => 4)
        bus.early?.should be_false
      end
    end

  end

  describe "ontime?" do

    context "the bus is early" do
      it "should return false" do
        bus = FactoryGirl.build(:bus, :adherence => -2)
        bus.ontime?.should be_false
      end
    end

    context "the bus is on time" do
      it "should return true" do
        bus = FactoryGirl.build(:bus, :adherence => 0)
        bus.ontime?.should be_true
      end
    end

    context "the bus is late" do
      it "should return false" do
        bus = FactoryGirl.build(:bus, :adherence => 4)
        bus.ontime?.should be_false
      end
    end

  end

  describe "late?" do

    context "the bus is early" do
      it "should return false" do
        bus = FactoryGirl.build(:bus, :adherence => -2)
        bus.late?.should be_false
      end
    end

    context "the bus is on time" do
      it "should return true" do
        bus = FactoryGirl.build(:bus, :adherence => 0)
        bus.late?.should be_false
      end
    end

    context "the bus is late" do
      it "should return false" do
        bus = FactoryGirl.build(:bus, :adherence => 4)
        bus.late?.should be_true
      end
    end

  end

end
