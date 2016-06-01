# frozen_string_literal: true
require 'test/unit'
require_relative '../mio_test'
require_relative '../../lib/pages/in_development/create_project_page'
require_relative '../../lib/web_service_clients/create_project_panel_webservice_client'

class CreateVideoProjectPageTest < MioTest

  def setup
    @browser = Watir::Browser.new :phantomjs
    @create_project_page = CreateProjectPage.new @browser
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
      assert_respond_to(@create_project_page, "#{attribute}_element")
    end
  end

  def teardown
    @browser.close
  end

end
