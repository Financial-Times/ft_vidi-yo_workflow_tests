require 'test/unit'
require_relative '../../lib/mio_exceptions/mio_exceptions'
require_relative '../../lib/pages/mio_page'
require_relative '../test_helper'

class MioTest < Test::Unit::TestCase
  include MioExceptions

  def setup
    @browser = Watir::Browser.new :phantomjs
    @mio_page = MioPage.new @browser
  end

  def test_has_common_header
    raise PageElementSelectorNotFoundException, 'site_header' unless @mio_page.respond_to? :site_header
  end

end
