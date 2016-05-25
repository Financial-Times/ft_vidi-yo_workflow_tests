require 'rest-client'
require_relative 'mio_webservice_client'
require_relative 'mio_metadata_description_webservice_client'

class MioFetchPanelWebserviceClient < MioWebserviceClient

  def initialize(user, url)
    super(user, url)
  end

  def build_url_for_data_definition(name)
    id = MioMetadataDescriptionWebserviceClient.new(WSUser.new).retrieve_id_with_name(name)
    "#{MioConstants::ROOT_URL}/api/metadataDefinitions/#{id}/definition"
  end

  def extract_panel_elements
    definitions = {}
    retrieve_panel_definitions.each do |element|
      definitions[element['name']] = element['type']
      puts "#{definitions[element['name']]}  #{element['type']}"
    end
    definitions
  end

  def extract_text_field_elements
    text_fields = {}
    extract_panel_elements.each do |key, value|
      text_fields[key] = value if value == 'text'
    end
    text_fields
  end

  def extract_selector_elements
    selectors = {}
    extract_panel_elements.each do |key, value|
      selectors[key] = value if value == 'single-option'
    end
    selectors
  end

  def extract_url_elements
    selectors = {}
    extract_panel_elements.each do |key, value|
      selectors[key] = value if value == 'url'
    end
    selectors
  end

  def extract_boolean_elements
    selectors = {}
    extract_panel_elements.each do |key, value|
      selectors[key] = value if value == 'boolean'
    end
    selectors
  end

  def extract_image_elements
    selectors = {}
    extract_panel_elements.each do |key, value|
      selectors[key] = value if value == 'image'
    end
    selectors
  end

  def retrieve_panel_definitions
    retrieve_metadata['definition']
  end

  def fetch_panel_description_by_id(id)
    mio_client = MioWebserviceClient.new(WSUser.new,
                                         "#{MioConstants::ROOT_URL}/api/metadataDefinitions/#{id}/definition")
    mio_client.retrieve_metadata
  end

  def fetch_panel_description_by_name(name)
    @mio_metadata_service = MioMetadataDescriptionWebserviceClient.new
    fetch_panel_description_by_id(@mio_metadata_service.retrieve_id_with_name(name))
  end

end
