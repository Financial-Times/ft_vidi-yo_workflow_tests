require_relative 'mio_fetch_panel_webservice_client'

class MioPublishPanelWebserviceClient < MioFetchPanelWebserviceClient

  attr_reader :url

  def initialize(user, url=nil)
    @url = build_url_for_data_definition 'publish-metadata'

    super(user, @url)
  end

end