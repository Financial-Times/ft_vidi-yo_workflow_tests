require_relative 'mio_webservice_client'
require_relative 'mio_fetch_panel_webservice_client'

class MioCreateIngestAssetWebserviceClient < MioFetchPanelWebserviceClient

  def initialize(user, url=nil)
    url = build_url_for_data_definition 'ingest-metadata'

    super(user, url)
  end

  def create_project_panel
    extract_panel_elements
  end

end