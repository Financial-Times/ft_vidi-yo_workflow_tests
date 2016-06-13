# frozen_string_literal: true
require 'test/unit'
require_relative '../video_test'
require_relative '../../lib/pages/in_development/project_page'
require_relative '../../lib/web_service_clients/create_project_panel_webservice_client'

class CreateVideoProjectPageTest < VideoTest

  def setup
    @browser = Watir::Browser.new :phantomjs
    @create_project_page = ProjectPage.new @browser
    @mio_fetch_panels_client = CreateProjectPanelWebserviceClient.new
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
      assert_respond_to(@create_project_page, "#{attribute.tr('-', '_')}_element")
    end
  end

  def test_has_submit_button
    assert_respond_to(@create_project_page, :submit_project_element)
  end

  def teardown
    @browser.close
  end

end
