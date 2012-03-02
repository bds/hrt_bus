require 'hrt_bus'
require 'factory_girl'
require 'ap'
require 'forgery'
require 'support/vcr_setup'
require 'tempfile'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
