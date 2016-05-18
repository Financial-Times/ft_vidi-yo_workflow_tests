require 'rest-client'
require_relative 'mio_ws_client'
class MioFetchPanelService < MioWSClient

  def initialize(user, url=nil)
    url = url.nil? ? 'https://master.dev.nativ-systems.com/api/metadataDefinitions/11312/definition' : url
    super(user, url)
  end

  def extract_panel_elements
    definitions = {}
    retrieve_panel_definitions.each do |element|
      definitions[element['name']] = element['type']
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

  def retrieve_panel_definitions
    metadata = retrieve_metadata

    if metadata.nil?
      cached_data = cached_create_project_panel_elements
      puts "Cached data: #{cached_data}"
      cached_data
    else
      live_data = metadata['definition']
      puts "Retrieved from WS #{Time.now} #{live_data}"
      live_data
    end
  end

end
