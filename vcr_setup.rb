# frozen_string_literal: true
require 'vcr'
require 'rspec'

LOG_FILE = File.expand_path(File.join(File.dirname(__FILE__), 'logs/vcr_log.log'))

VCR.configure do |c|
  c.cassette_library_dir = File.expand_path(File.join(File.dirname(__FILE__), 'vcr_cassettes'))
  c.hook_into :webmock
  c.ignore_localhost = true
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
  c.debug_logger = File.open(LOG_FILE, 'w')
  c.default_cassette_options = {record: :new_episodes}
  c.around_http_request do |request|
    VCR.use_cassette('client', match_requests_on: [:method, :uri, :body], &request)
  end
end
