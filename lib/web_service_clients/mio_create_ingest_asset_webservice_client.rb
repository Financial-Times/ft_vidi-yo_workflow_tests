require_relative 'mio_fetch_panel_webservice_client'

##
# Retrieves metadata definition to create accessors for the Ingest Asset web page
class MioCreateIngestAssetWebserviceClient < MioFetchPanelWebserviceClient


  def initialize(user=WSUser.new)
    super(user, build_url_for_data_definition('ingest-metadata'))
  end

end
