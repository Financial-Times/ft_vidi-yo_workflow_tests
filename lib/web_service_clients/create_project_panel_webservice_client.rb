require 'rest-client'
require_relative '../../test/data/ws_user'
require_relative 'mio_fetch_panel_webservice_client'
require_relative 'mio_metadata_description_webservice_client'

class CreateProjectPanelWebserviceClient < MioFetchPanelWebserviceClient

  def initialize(user, url=nil)

    url = build_url_for_data_definition

    super(user, url)
  end

  def build_url_for_data_definition
    id = MioMetadataDescriptionWebserviceClient.new(WSUser.new).retrieve_id_with_name('project-metadata')
    "https://master.dev.nativ-systems.com/api/metadataDefinitions/#{id}/definition"
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
