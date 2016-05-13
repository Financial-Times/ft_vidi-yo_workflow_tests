require_relative 'mio_ws_client.rb'
require 'rest-client'

class CreateProjectPanelService < MioWSClient

  def get_create_project_panel_attributes
    definitions = get_project_panel_definitions
    attributes = []
    definitions.each do |definition|
      attributes << definition['name']
    end
    attributes
  end

  private

  def get_project_panel_definitions
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