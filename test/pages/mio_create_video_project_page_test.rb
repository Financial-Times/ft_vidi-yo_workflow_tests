require 'test/unit'
require_relative '../../lib/pages/in_development/mio_create_video_project_page'
require_relative 'mio_test'
require_relative '../../lib/services/create_project_panel_service'

class MioCreateVideoProjectPageTest < MioTest


  def setup
    @browser = Watir::Browser.new :phantomjs
    @create_project_page = MioCreateVideoProjectPage.new @browser
    @mio_client = CreateProjectPanelService.new
    fetch_expected_page_elements
  end

  def fetch_expected_page_elements
    @text_fields = @mio_client.get_create_project_panel_elements
    @create_project_form_attributes = {}
    @text_fields.each do |key, value|
      @create_project_form_attributes = {key => value}
    end
  end


  def test_has_attributes
    @create_project_form_attributes.each_key do |key|
      raise PageElementSelectorNotFoundException, key unless @create_project_page.respond_to? key
    end
  end

  def test_get_text_fields
    text_fields = @mio_client.get_text_field_elements
    text_fields.each do |key, value|
      fail "#{key} is not a text field (#{value}" unless value == 'text'
    end
  end

  def test_get_selectors
    selectors = @mio_client.get_selector_elements
    selectors.each do |key, value|
      puts key, value
      fail "#{key} is not a selector (#{value}" unless value == 'single-option'
    end
  end


  def teardown
    @browser.close
  end

end