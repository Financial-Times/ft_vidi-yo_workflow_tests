require_relative '../mio_page'
require_relative '../../../lib/web_service_clients/mio_create_project_panel_webservice_client'

class MioCreateVideoProjectPage < MioPage

  webservice_client = MioCreateProjectPanelWebserviceClient.new

  webservice_client.extract_text_field_elements.each do |name, attribute|
    text_field(name, id: 'TBC')
  end

  webservice_client.extract_selector_elements.each do |name, attribute|
    select_list(name, id: 'TBC')
  end

  webservice_client.extract_url_elements.each do |name, attribute|
    link(name, id: 'TBC')
  end

  webservice_client.extract_boolean_elements.each do |name, attribute|
    element(name, id: 'TBC') #TBC - depends on implementation
  end

  webservice_client.extract_image_elements.each do |name, attribute|
    img(name, id: 'TBC')
  end

  button(:create_project, id: 'TBC')

end
