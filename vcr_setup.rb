# frozen_string_literal: true
require 'vcr'
require 'rspec'
require_relative 'config/config'

LOG_FILE = File.expand_path(File.join(File.dirname(__FILE__), 'logs/vcr_log.log'))
LIBRARY = File.expand_path(File.join(File.dirname(__FILE__), 'vcr_cassettes'))
puts "      LIBRARY:  #{LIBRARY}"

VCR.configure do |c|
  c.cassette_library_dir = LIBRARY
  c.hook_into :webmock
  c.ignore_localhost = true
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
  c.debug_logger = File.open(LOG_FILE, 'w')
  c.default_cassette_options = {record: :new_episodes}
end
