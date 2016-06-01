# frozen_string_literal: true
require 'test/unit'
require_relative '../../lib/pages/mio_page'
require_relative '../test_helper'

class MioPageTest < MioTest

  def setup
    @browser = Watir::Browser.new :phantomjs
    @base_page = MioPage.new @browser
  end

  def test_is_a_mio_page
    assert_kind_of(MioPage, @base_page)
  end

  def test_has_common_header
    assert @base_page.respond_to? :site_header, "'site_header' missing from page"
  end

  def teardown
    @browser.close
  end

end
