# frozen_string_literal: true
require 'test/unit'
require_relative '../mio_test'
require_relative '../../lib/pages/in_development/publish_video_page'
require_relative '../../lib/web_service_clients/publish_panel_webservice_client'

class PublishVideoPageTest < MioTest

  def setup
    @browser = Watir::Browser.new :phantomjs
    @publish_video_page = PublishVideoPage.new @browser
    @retrieve_publish_panels_client = PublishPanelWebserviceClient.new
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
      attribute_name = attribute.gsub('-', '_')
      assert_respond_to(@publish_video_page, "#{attribute_name}_element")
    end
  end

  def teardown
    @browser.close
  end

end
