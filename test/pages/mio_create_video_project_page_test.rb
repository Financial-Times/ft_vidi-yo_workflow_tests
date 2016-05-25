require 'test/unit'
require_relative '../mio_test'
require_relative '../../lib/pages/in_development/mio_create_video_project_page'
require_relative '../../lib/web_service_clients/mio_create_project_panel_webservice_client'

class MioCreateVideoProjectPageTest < MioTest

  def setup
    @browser = Watir::Browser.new :phantomjs
    @create_project_page = MioCreateVideoProjectPage.new @browser
    @mio_fetch_panels_client = MioCreateProjectPanelWebserviceClient.new
    fetch_expected_page_elements
  end

  def fetch_expected_page_elements
    @create_project_form_attributes ||= {}
    @mio_fetch_panels_client.extract_panel_elements.each do |key, value|
      @create_project_form_attributes[key] = value
    end
  end

  def test_has_attributes
    @create_project_form_attributes.each_key do |attribute|
      assert_respond_to(@create_project_page, "#{attribute}_element")
    end
  end

  def teardown
    @browser.close
  end

end
