require 'test/unit'
require_relative '../lib/pages/mio_page'
require_relative '../lib/mio_exceptions/mio_exceptions'
require_relative 'mio_test'


class MioPageTest < MioTest
  include MioExceptions

  def setup
    @browser = Watir::Browser.new :phantomjs
    @base_page = MioPage.new @browser
  end

  def test_is_a_mio_page
    raise ObjectIsNotAPageException unless @base_page.is_a?(MioPage)
  end

  def teardown
    @browser.close
  end

end