require 'spec_helper'
require 'factories/bus'

describe HrtBus::Parse do
  describe "time" do
    let(:parsed_time) { HrtBus::Parse.time("01:35:26", "03/03") }

    it "should parse the time correctly" do
      parsed_time.should be_a_kind_of(DateTime)
    end
  end

end
