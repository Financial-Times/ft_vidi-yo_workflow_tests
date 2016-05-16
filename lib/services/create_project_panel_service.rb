require_relative 'mio_ws_client.rb'
require 'rest-client'
require_relative '../../test/data/ws_user'

class CreateProjectPanelService < MioWSClient

  def initialize(user=WSUser.new)
    super(user)
  end


  def get_create_project_panel_elements
    definitions = {}
    get_create_project_panel_definitions.each do |element|
      definitions[element['name']] = element['type']
    end
    definitions
  end

  def get_text_field_elements
    text_fields = {}
    get_create_project_panel_elements.each do |key, value|
      if value == 'text'
        text_fields[key] = value
      end
    end
    text_fields
  end

  def get_selector_elements
    selectors = {}
    get_create_project_panel_elements.each do |key, value|
      if value == 'single-option'
        selectors[key] = value
      end
    end
    selectors
  end


  private

  def get_create_project_panel_definitions
    get_create_project_panel_metadata['definition']
  end

  def get_create_project_panel_metadata
    response = RestClient::Request.execute(method: :get,
                                           url: 'https://master.dev.nativ-systems.com/api/metadataDefinitions/11312/definition',
                                           user: @username,
                                           password: @password,
                                           headers: @headers
    )
    JSON.parse(response)
  end


end