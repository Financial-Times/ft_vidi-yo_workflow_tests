# frozen_string_literal: true
require 'page-object'

##
# Base class for all Mio PageObjects
class MioPage

  include PageObject

  element :site_header, id: 'TBC'
  element :test_element, id: 'textarea-test_element'


  def self.element_type(element_id_value)
    puts element_id_value.split('-', 2)[0]
    element_id_value.split('-', 2)[0]
  end

  def self.element_id(element_id_value)
    puts element_id_value.split('-', 2)[1]
    element_id_value.split('-', 2)[1]
  end

  # Retrieves element descriptions from web service and defines them as
  # PageObject::Accessors
  # Takes a MioFetchPanelWebserviceClient object
  def self.define_page_elements(webservice_client)
    webservice_client.extract_text_field_elements.each_key do |name|
      textarea(name, id: Regexp.new(name))
    end

    webservice_client.extract_selector_elements.each_key do |name|
      select_list(name, id: Regexp.new(name))
    end

    webservice_client.extract_url_elements.each_key do |name|
      link(name, id: Regexp.new(name))
    end

    webservice_client.extract_boolean_elements.each_key do |name|
      element(name, id: 'TBC') # TBC - depends on implementation
    end

    webservice_client.extract_image_elements.each_key do |name|
      image(name, id: Regexp.new(name))
    end
  end

end
