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