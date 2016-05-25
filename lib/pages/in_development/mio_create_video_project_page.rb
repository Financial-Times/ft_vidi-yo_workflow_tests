require_relative '../mio_page'
require_relative '../../../lib/web_service_clients/mio_create_project_panel_webservice_client'

class MioCreateVideoProjectPage < MioPage

  define_page_elements(MioCreateProjectPanelWebserviceClient.new)

  button(:create_project, id: 'TBC')

end
