# frozen_string_literal: true
require_relative 'fetch_panel_webservice_client'

##
# Retrieves metadata definition to create accessors for the Publish Panel web page
class PublishPanelWebserviceClient < FetchPanelWebserviceClient

  attr_reader :url

  def initialize(user=WSUser.new, _url=nil)
    super(user, build_url_for_data_definition('publish-metadata'))
  end

end
