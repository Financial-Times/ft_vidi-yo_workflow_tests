require_relative 'mio_webservice_client'
require_relative 'mio_fetch_panel_webservice_client'

class MioCreateIngestAssetWebserviceClient < MioFetchPanelWebserviceClient

  def initialize(user, url=nil)
    url = build_url_for_data_definition

    super(user, url)
  end

  def build_url_for_data_definition
    id = MioMetadataDescriptionWebserviceClient.new(WSUser.new).retrieve_id_with_name('ingest-metadata')
    "https://master.dev.nativ-systems.com/api/metadataDefinitions/#{id}/definition"
  end

  def create_project_panel
    extract_panel_elements
  end

end