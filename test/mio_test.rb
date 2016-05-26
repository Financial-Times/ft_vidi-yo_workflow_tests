require 'test/unit'
require_relative '../lib/pages/mio_page'
require_relative 'test_helper'

class MioTest < Test::Unit::TestCase

  def setup
    @browser = Watir::Browser.new :phantomjs
    @mio_page = MioPage.new @browser
  end

  def test_has_common_header
    assert @mio_page.respond_to? :site_header, "'site_header' missing from page"
  end

end
