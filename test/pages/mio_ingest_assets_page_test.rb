require 'test/unit'
require_relative '../../lib/pages/in_development/mio_ingest_assets_page'
require_relative 'mio_test'

class MioIngestAssetsPageTest < MioTest

  def setup
    @browser = Watir::Browser.new :phantomjs
    @ingest_assets_page = MioIngestAssetsPage.new @browser
  end

  def test_is_a_mio_page
    raise ObjectIsNotAPageException unless @ingest_assets_page.is_a?(MioPage)
  end

  def test_has_a_heading
    raise PageElementSelectorNotFoundException, 'page_heading' unless
        @ingest_assets_page.respond_to? :page_heading
  end

  def test_has_project_name_display
    raise PageElementSelectorNotFoundException, 'project_name' unless
        @ingest_assets_page.respond_to? :project_name
  end

  def test_has_a_clip_type_selector
    raise PageElementSelectorNotFoundException, 'clip_type' unless
        @ingest_assets_page.respond_to? :clip_type_selector
  end

  def test_has_a_clip_description_field
    raise PageElementSelectorNotFoundException, 'clip_description' unless
        @ingest_assets_page.respond_to? :clip_description
  end

  def test_has_a_location_selector
    raise PageElementSelectorNotFoundException, 'location' unless
        @ingest_assets_page.respond_to? :location_selector
  end

  def test_has_an_interviewee_field
    raise PageElementSelectorNotFoundException, 'interviewee_selector' unless
        @ingest_assets_page.respond_to? :interviewee_selector
  end

  def test_has_an_ft_office_selector
    raise PageElementSelectorNotFoundException, 'ft_office_selector' unless
        @ingest_assets_page.respond_to? :ft_office_selector
  end

  def test_has_a_producer_selector
    raise PageElementSelectorNotFoundException, 'producer_selector' unless
        @ingest_assets_page.respond_to? :producer_selector
  end

  def test_has_a_freelance_producer_selector
    raise PageElementSelectorNotFoundException, 'freelance_producer_selector' unless
        @ingest_assets_page.respond_to? :freelance_producer_selector
  end

  def test_has_reporter_writer_fields
    raise PageElementSelectorNotFoundException, 'reporter_writer_1' unless
        @ingest_assets_page.respond_to? :reporter_writer_1
    raise PageElementSelectorNotFoundException, 'reporter_writer_2' unless
        @ingest_assets_page.respond_to? :reporter_writer_2
    raise PageElementSelectorNotFoundException, 'reporter_writer_3' unless
        @ingest_assets_page.respond_to? :reporter_writer_3
  end


  def test_has_restrictions_selectors
    raise PageElementSelectorNotFoundException,
          'has_restrictions' unless
            @ingest_assets_page.respond_to? :select_has_restrictions
  end

  def test_has_restrictions_description_field

    raise PageElementSelectorNotFoundException,
          'restriction_description_field' unless
            @ingest_assets_page.respond_to? :restriction_description

  end

  def test_has_ingest_button
    raise PageElementSelectorNotFoundException 'ingest_button' unless
        @ingest_assets_page.respond_to? :ingest_button
  end

  def teardown
    @browser.close
  end

end