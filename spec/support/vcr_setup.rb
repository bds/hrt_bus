require 'vcr'

uri_without_auth_token  = VCR.request_matchers.uri_without_param(:auth_token)

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { :match_requests_on => [:method, uri_without_auth_token] }
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end
