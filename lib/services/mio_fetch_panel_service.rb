require_relative 'mio_ws_client'
class MioFetchPanelService < MioWSClient

  def get_panel_elements
    definitions = {}
    get_panel_definitions.each do |element|
      definitions[element['name']] = element['type']
    end
    definitions
  end

  def get_text_field_elements
    text_fields = {}
    get_panel_elements.each do |key, value|
      if value == 'text'
        text_fields[key] = value
      end
    end
    text_fields
  end

  def get_selector_elements
    selectors = {}
    get_panel_elements.each do |key, value|
      if value == 'single-option'
        selectors[key] = value
      end
    end
    selectors
  end

  def get_panel_definitions
    if get_metadata.nil?
      cached_data = cached_create_project_panel_elements
      puts "Cached data: #{cached_data}"
      cached_data
    else
      live_data = get_metadata['definition']
      puts "Retrieved from WS #{Time.now} #{live_data}"
      live_data
    end
  end

end