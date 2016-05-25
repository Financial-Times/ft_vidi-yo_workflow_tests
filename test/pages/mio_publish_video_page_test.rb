require_relative '../test_helper'
require_relative '../../lib/pages/in_development/mio_publish_video_page'

class MioPublishVideoPageTest < MioTest

  include MioExceptions

  def setup
    @browser = Watir::Browser.new :phantomjs
    @export_video_page = MioPublishVideoPage.new @browser
    @export_video_form_attributes =
      %i(
        section brand headline_field long_lead_field headline_field long_lead_field short_lead_field
        related_content_fields_elements credit ft_office_selector producer_selector thumbnail_previews_elements
        select_has_restrictions  select_no_restrictions restriction_description add_thumbnails_drop_zone
        export_button
      )
  end

  def test_has_attributes
    @export_video_form_attributes.each do |attribute|
      assert_respond_to(@export_video_page, attribute)
    end
  end

  def teardown
    @browser.close
  end

end
