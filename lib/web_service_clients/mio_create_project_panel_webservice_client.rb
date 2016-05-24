require_relative 'mio_fetch_panel_webservice_client'

class MioCreateProjectPanelWebserviceClient < MioFetchPanelWebserviceClient

  def initialize(user=WSUser.new, _url=nil)
    super(user, build_url_for_data_definition('project-metadata'))
  end

end
