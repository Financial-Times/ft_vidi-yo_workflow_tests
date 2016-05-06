require 'test/unit'
require_relative '../lib/pages/mio_base_page'


class MioBasePageTest < Test::Unit::TestCase

  def setup
    @browser = Watir::Browser.new(:phantomjs)
    @base_page = MioBasePage.new(@browser)
  end

  def test_is_a_page
    raise "Not a PageObject" unless @base_page.is_a?(PageObject)
  end

  def teardown
    @browser.close
  end

end