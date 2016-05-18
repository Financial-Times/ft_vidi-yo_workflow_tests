require_relative '../../lib/pages/in_development/mio_ingest_assets_page'
require_relative '../../lib/pages/mio_metadata_entry_form'
require_relative 'mio_test'

class MioIngestAssetsPageTest < MioTest

  def setup
    @browser = Watir::Browser.new :phantomjs
    @ingest_assets_page = MioIngestAssetsPage.new @browser
    @ingest_assets_form_attributes =
      %i(
        page_heading project clip_type_selector clip_description location_selector interviewee_selector
        ft_office_selector producer_selector freelance_producer_selector reporter_writer_1 reporter_writer_2
        reporter_writer_3 select_has_restrictions select_no_restrictions ingest_button
      )
  end

  def test_has_attributes
    @ingest_assets_form_attributes.each do |attribute|
      raise PageElementSelectorNotFoundException, attribute unless @ingest_assets_page.respond_to? attribute
    end
  end

  def test_can_create_asset_ingestion
    raise PageElementSelectorNotFoundException 'ingest_button' unless @ingest_assets_page.respond_to? :create_ingestion
  end

  def teardown
    @browser.close
  end

end
