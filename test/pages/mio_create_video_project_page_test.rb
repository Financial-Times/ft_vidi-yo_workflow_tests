require 'test/unit'
require_relative 'mio_test'
require_relative '../../lib/pages/in_development/mio_create_video_project_page'
require_relative '../../lib/services/create_project_panel_service'


class MioCreateVideoProjectPageTest < MioTest


  def setup
    @browser = Watir::Browser.new :phantomjs
    @create_project_page = MioCreateVideoProjectPage.new @browser
    @mio_client = CreateProjectPanelService.new(WSUser.new)
    fetch_expected_page_elements
  end

  def fetch_expected_page_elements
    elements = @mio_client.create_project_panel
    @create_project_form_attributes ||= {}
    elements.each do |key, value|
      @create_project_form_attributes[key] = value
    end
  end

  def test_has_attributes
    @create_project_form_attributes.each_key do |key|
      raise PageElementSelectorNotFoundException, key unless @create_project_page.respond_to? key
    end
  end



  def teardown
    @browser.close
  end

end