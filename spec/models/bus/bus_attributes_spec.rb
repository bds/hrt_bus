require 'spec_helper'

describe HrtBus::Bus do
  it { should respond_to(:id) }
  it { should respond_to(:direction) }
  it { should respond_to(:route_id) }
  it { should respond_to(:time) }
  it { should respond_to(:lat) }
  it { should respond_to(:lon) }
end
