require 'rest-client'
require_relative 'mio_webservice_client'
require_relative 'mio_metadata_description_webservice_client'

###
# Extracts and parses definitions from metadata.
class MioFetchPanelWebserviceClient < MioWebserviceClient

  def initialize(user, url)
    super(user, url)
  end

  # Returns URL for individual definition requests
  def build_url_for_data_definition(name)
    id = MioMetadataDescriptionWebserviceClient.new(WSUser.new).retrieve_id_with_name(name)
    "#{MioConstants::ROOT_URL}/api/metadataDefinitions/#{id}/definition"
  end

  # Extracts panel elements from description metadata
  def extract_panel_elements
    definitions = {}
    retrieve_panel_definitions.each do |element|
      definitions[element['name']] = element['type']
    end
    definitions
  end

  def extract_elements(type)
    elements = {}
    extract_panel_elements.each do |key, value|
      elements[key] = value if value == type
    end
    elements
  end

  # Returns text field elements from description metadata
  def extract_text_field_elements
    extract_elements 'text'
  end

  # Returns text elements from description metadata
  def extract_selector_elements
    extract_elements 'single-option'
  end

  # Returns text url elements from description metadata
  def extract_url_elements
    extract_elements 'url'
  end

  # Returns booleans (to implement checkboxes or radios) from description metadata
  def extract_boolean_elements
    extract_elements 'boolean'
  end

  # Returns image elements from description metadata
  def extract_image_elements
    extract_elements 'image'
  end

  # Parses descriptions from metadata
  def retrieve_panel_definitions
    retrieve_definition['definition']
  end

  # Takes a metadata definition id and returns description for that element
  def fetch_panel_description_by_id(id)
    mio_client = MioWebserviceClient.new(WSUser.new,
                                         "#{MioConstants::ROOT_URL}/api/metadataDefinitions/#{id}/definition")
    mio_client.retrieve_definition
  end

  # Takes a metadata definition name and returns description for that element
  def fetch_panel_description_by_name(name)
    @mio_metadata_service = MioMetadataDescriptionWebserviceClient.new
    fetch_panel_description_by_id(@mio_metadata_service.retrieve_id_with_name(name))
  end

end
