# frozen_string_literal: true
require_relative '../mio_page'
require_relative '../../web_service_clients/publish_panel_webservice_client'
require_relative '../../../test/factories/publish_video_factory'

##
# PageObject for Publish Video page
class PublishVideoPage < MioPage

  define_page_elements(PublishPanelWebserviceClient.new)

  span :export_button, text: 'submit'

  ##
  # Uses the web interface to publish the project
  #
  # @param asset [MioExportVideo]
  # @return [String]
  def publish_video(asset=FactoryGirl.build(:publish_video))
    puts asset.class
    headline_element.when_present.value = asset.headline
    long_lead_element.value = asset.long_lead
    short_lead_element.value = asset.short_lead
    link_1_element.value = asset.related_content
    credit_element.value = asset.credit
    freelance_video_editor_element.value = asset.freelance_video_editor
    Logger.new($stderr).warn 'Cannot access Video Publish Page restrictions at present: outstanding bug'
    Logger.new($stderr).warn 'Video Publish Page: Poster Image not implemented'
    Logger.new($stderr).warn 'Video Publish Page: Thumbnail not implemented'
    Logger.new($stderr).warn('Assert not yet possible on Video Publish page')
    export_button
  end

end
