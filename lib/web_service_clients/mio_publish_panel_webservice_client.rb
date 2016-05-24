require_relative 'mio_fetch_panel_webservice_client'

class MioPublishPanelWebserviceClient < MioFetchPanelWebserviceClient

  attr_reader :url

  def initialize(user, url=nil)
    @url = build_url_for_data_definition

    super(user, @url)
  end

  def build_url_for_data_definition
    id = MioMetadataDescriptionWebserviceClient.new(WSUser.new).retrieve_id_with_name('publish-metadata')
    "https://master.dev.nativ-systems.com/api/metadataDefinitions/#{id}/definition"
  end

end