require 'test/unit'
require_relative '../test_helper'
require_relative '../../lib/web_service_clients/mio_publish_panel_webservice_client'

class MioPublishPanelClientTest < MioTest

  def setup
    @mio_publish_panel_client = MioPublishPanelWebserviceClient.new(WSUser.new)
    @mio_metadata_service = MioMetadataDescriptionWebserviceClient.new(WSUser.new)
  end

  def test_build_url_for_data_definition
    panel_name = 'publish-metadata'
    id = @mio_metadata_service.retrieve_id_with_name(panel_name)
    url = @mio_publish_panel_client.build_url_for_data_definition (panel_name)
    assert_match(/api\/metadataDefinitions\/#{id}\/definition/, url)
  end

  def test_extract_publish_panel_elements
    elements = @mio_publish_panel_client.extract_panel_elements
    assert_kind_of(Hash, elements)
    assert(elements.has_key?('headline') || elements.has_key?('text'),
           'Does not have expected element (headline => text)')
  end

  def test_retrieve_publish_panel_definitions
    ingest_panel_definitions = @mio_publish_panel_client.retrieve_panel_definitions
    assert_kind_of(Array, ingest_panel_definitions)
  end

end