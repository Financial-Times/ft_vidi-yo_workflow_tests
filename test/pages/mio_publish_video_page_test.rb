require 'test/unit'
require_relative '../mio_test'
require_relative '../../lib/pages/in_development/mio_publish_video_page'
require_relative '../../lib/web_service_clients/mio_publish_panel_webservice_client'

class MioPublishVideoPageTest < MioTest

  include MioExceptions

  def setup
    @browser = Watir::Browser.new :phantomjs
    @publish_video_page = MioPublishVideoPage.new @browser
    @retrieve_publish_panels_client = MioPublishPanelWebserviceClient.new
    fetch_expected_page_elements
  end

  def fetch_expected_page_elements
    @publish_video_project_form_attributes = {}
    @retrieve_publish_panels_client.extract_panel_elements.each do |key, value|
      @publish_video_project_form_attributes[key] = value
    end
  end

  def test_has_attributes
    @publish_video_project_form_attributes.each_key do |attribute|
      assert_respond_to(@publish_video_page, attribute)
    end
  end

  def teardown
    @browser.close
  end

end
