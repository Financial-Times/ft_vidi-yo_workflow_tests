# frozen_string_literal: true
require 'vcr'
require 'rspec'

VCR.configure do |c|
  c.cassette_library_dir = File.expand_path(File.join(File.dirname(__FILE__), 'test/vcr_cassettes'))
  c.hook_into :webmock
  c.ignore_localhost = true
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
  c.debug_logger = File.open('logs/vcr_log.log', 'w')
end
