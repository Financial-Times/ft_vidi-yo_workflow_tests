require_relative '../mio_page'
require_relative '../../web_service_clients/mio_publish_panel_webservice_client'

##
# PageObject for Publish Video page
class MioPublishVideoPage < MioPage

  image('poster-image', id: 'TBC')
  image('thumbnail', id: 'TBC')

  define_page_elements(MioPublishPanelWebserviceClient.new)

  button :export_button, id: 'TBC'

end
