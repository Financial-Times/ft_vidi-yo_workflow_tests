require_relative '../mio_page'
require_relative '../../../lib/web_service_clients/create_project_panel_webservice_client'

##
# PageObject for Create Video page
class CreateProjectPage < MioPage

  define_page_elements(CreateProjectPanelWebserviceClient.new)

  button(:create_project, id: 'TBC')

end
