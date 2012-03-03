require 'active_model'
require 'yajl/json_gem'
require 'active_support/core_ext/hash'
require 'active_support/core_ext/object'
require 'csv'
require 'curb'
require 'googlestaticmap'

require "hrt_bus/version"
require "hrt_bus/config"
require "hrt_bus/parse"
require "hrt_bus/bus"
require "hrt_bus/rider"

HrtBus::Config.configure do |config|
  config.buses_uri = "ftp://216.54.15.3/Anrd/hrtrtf.txt"
  config.timeout = 10
end
