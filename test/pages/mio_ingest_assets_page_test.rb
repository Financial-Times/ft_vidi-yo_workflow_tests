require 'test-unit'
require_relative '../mio_test'
require_relative '../../lib/pages/in_development/mio_ingest_assets_page'
require_relative '../../lib/web_service_clients/mio_create_ingest_asset_webservice_client'

class MioIngestAssetsPageTest < MioTest

  def setup
    @browser = Watir::Browser.new :phantomjs
    @ingest_assets_page = MioIngestAssetsPage.new @browser
    @retrieve_ingest_panels_client = MioCreateIngestAssetWebserviceClient.new
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
      assert_respond_to(@ingest_assets_page, attribute)
    end
  end

  def test_can_create_asset_ingestion
    assert_respond_to(@ingest_assets_page, :create_ingestion)
  end

  def teardown
    @browser.close
  end

end
