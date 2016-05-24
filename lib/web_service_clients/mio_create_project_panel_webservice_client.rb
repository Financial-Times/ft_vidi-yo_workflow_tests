require 'rest-client'
require_relative '../../test/data/ws_user'
require_relative 'mio_fetch_panel_webservice_client'
require_relative 'mio_metadata_description_webservice_client'

class MioCreateProjectPanelWebserviceClient < MioFetchPanelWebserviceClient

  def initialize(user, url=nil)

    url = build_url_for_data_definition 'project-metadata'

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
