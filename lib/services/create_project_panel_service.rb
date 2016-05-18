require 'rest-client'
require_relative '../../test/data/ws_user'
require_relative 'mio_fetch_panel_service'

class CreateProjectPanelService < MioFetchPanelService

  def initialize(user, url=nil)
    url = url.nil? ? 'https://master.dev.nativ-systems.com/api/metadataDefinitions/11312/definition' : url
    super(user, url)
  end

  def cached_create_project_panel_elements

    JSON.parse(
        '[
            {
              "name": "project",
              "type": "text"
            },

            {
              "name": "section",
              "type": "single-option"
            },

            {
              "name": "brand",
              "type": "single-option"
            }
          ]'
    )
  end

  def create_project_panel
    extract_panel_elements
  end

end

