# frozen_string_literal: true
require_relative '../mio_page'
require_relative '../../web_service_clients/publish_panel_webservice_client'

##
# PageObject for Publish Video page
class PublishVideoPage < MioPage

  define_page_elements(PublishPanelWebserviceClient.new)

  button :export_button, id: 'TBC'

end
