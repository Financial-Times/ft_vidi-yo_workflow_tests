# frozen_string_literal: true
require 'test-unit'
require_relative '../mio_test'
require_relative '../../lib/pages/in_development/ingest_page'
require_relative '../../lib/web_service_clients/create_ingest_asset_webservice_client'

class IngestPageTest < MioTest

  def setup
    @browser = Watir::Browser.new :phantomjs
    @ingest_assets_page = IngestPage.new @browser
    @retrieve_ingest_panels_client = CreateIngestAssetWebserviceClient.new
    fetch_expected_page_elements
  end

  def fetch_expected_page_elements
    @ingest_assets_form_attributes = {}
    @retrieve_ingest_panels_client.extract_panel_elements.each do |key, value|
      @ingest_assets_form_attributes[key] = value
    end
  end

  def test_has_attributes
    @ingest_assets_form_attributes.each_key do |attribute|
      attribute_name = attribute.gsub('-', '_')
      element = "#{attribute_name}_element".to_sym
      puts element
      assert_respond_to(@ingest_assets_page, element)
    end
  end

  def test_can_create_asset_ingestion
    assert_respond_to(@ingest_assets_page, :create_ingestion)
  end

  def teardown
    @browser.close
  end

end
