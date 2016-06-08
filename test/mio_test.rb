# frozen_string_literal: true
require 'test/unit'
require_relative '../lib/pages/mio_page'
require_relative '../test/data/ws_user'
require_relative '../config/config'

class MioTest < Test::Unit::TestCase

  include Config::Constants
  include Config::Logging

end
