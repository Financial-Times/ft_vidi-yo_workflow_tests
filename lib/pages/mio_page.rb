# frozen_string_literal: true
require 'page-object'

##
# Base class for all Mio PageObjects
class MioPage

  include PageObject

  element :site_header, id: 'TBC'

  # Retrieves element descriptions from web service and defines them as
  # PageObject::Accessors
  # Takes a MioFetchPanelWebserviceClient object
  def self.define_page_elements(webservice_client)
    webservice_client.extract_text_field_elements.each_key do |name|
      text_field(name, id: 'TBC')
    end

    webservice_client.extract_selector_elements.each_key do |name|
      select_list(name, id: 'TBC')
    end

    webservice_client.extract_url_elements.each_key do |name|
      link(name, id: 'TBC')
    end

    webservice_client.extract_boolean_elements.each_key do |name|
      element(name, id: 'TBC') # TBC - depends on implementation
    end

    webservice_client.extract_image_elements.each_key do |name|
      image(name, id: 'TBC')
    end
  end

end
