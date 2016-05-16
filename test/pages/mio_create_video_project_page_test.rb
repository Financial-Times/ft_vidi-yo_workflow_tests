require 'test/unit'
require_relative '../../lib/pages/in_development/mio_create_video_project_page'
require_relative 'mio_test'
require_relative '../../lib/services/create_project_panel_service'

class MioCreateVideoProjectPageTest < MioTest


  def setup
    @browser = Watir::Browser.new :phantomjs
    @create_project_page = MioCreateVideoProjectPage.new @browser
    @mio_client = CreateProjectPanelService.new
    fetch_expected_page_methods
  end

  def fetch_expected_page_methods
    @elements = @mio_client.get_create_project_panel_elements
    @create_project_form_attributes =[]
    @elements.keys.each do |key|
      @create_project_form_attributes << key
    end
  end


  def test_has_attributes
    @create_project_form_attributes.each do |attribute|
      raise PageElementSelectorNotFoundException, attribute unless @create_project_page.respond_to? attribute
    end
  end


  def teardown
    @browser.close
  end

end