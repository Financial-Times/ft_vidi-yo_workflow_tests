require 'test/unit'
require_relative '../lib/pages/in_development/mio_create_video_project_page'
require_relative 'mio_test'

class MioCreateVideoProjectPageTest < MioTest


  def setup
    @browser = Watir::Browser.new :phantomjs
    @create_project_page = MioCreateVideoProjectPage.new @browser
  end

  def test_is_a_mio_page
    raise ObjectIsNotAPageException unless @create_project_page.is_a?(MioPage)
  end

  def test_page_has_project_name_field
    raise PageElementSelectorNotFoundException, 'project_name_field' unless @create_project_page.respond_to? :project_name_field
  end

  def test_page_has_section_selector
    raise PageElementSelectorNotFoundException, 'section_selector' unless @create_project_page.respond_to? :section_selector
  end

  def test_page_has_brand_selectors
    raise PageElementSelectorNotFoundException, 'brand_selectors' unless @create_project_page.respond_to? :brand_selectors_elements
  end

  def teardown
    @browser.close
  end

end