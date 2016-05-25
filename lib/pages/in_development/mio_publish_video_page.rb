require_relative '../mio_page'
require_relative '../../web_service_clients/mio_publish_panel_webservice_client'

class MioPublishVideoPage < MioPage

  # TODO: Highly homogeneous: refactor.
  webservice_client = MioPublishPanelWebserviceClient.new

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
    element(name, id: 'TBC') #TBC - depends on implementation
  end



  button :export_button, id: 'TBC'

end
