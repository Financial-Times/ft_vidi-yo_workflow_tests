require_relative '../mio_page'
require_relative '../mio_metadata_entry_form'
require_relative '../../../lib/web_service_clients/mio_create_project_panel_webservice_client'

class MioCreateVideoProjectPage < MioPage

  MioCreateProjectPanelWebserviceClient.new.extract_text_field_elements.each do |k, _v|
    text_field(k, id: 'TBC')
  end

  MioCreateProjectPanelWebserviceClient.new.extract_selector_elements.each do |k, _v|
    select_list(k, id: 'TBC')
  end

end
