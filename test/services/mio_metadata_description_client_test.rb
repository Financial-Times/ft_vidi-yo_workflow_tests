require 'test/unit'
require_relative '../test_helper'
require_relative '../../lib/web_service_clients/mio_metadata_description_webservice_client'
require_relative '../../test/data/ws_user'

class MioMetadataDescriptionClientTest < MioTest

  def setup
    @mio_metadata_service = MioMetadataDescriptionWebserviceClient.new(WSUser.new)
  end

  def test_retrieves_description_config
    response = @mio_metadata_service.retrieve_descriptions
    assert((response.respond_to? :each_key), "Data returned in invalid format (#{response.class})")
    assert((response.has_key? 'metadataDefinitions'), 'data returned has no definitions')
  end

  def test_can_retrieve_description_by_name
    description = @mio_metadata_service.retrieve_description_by_name('project-metadata')
    assert((description['name'] == 'project-metadata'), "Name in response incorrect (#{description['name']})")
  end

  def test_can_retrieve_id_with_name
    id = @mio_metadata_service.retrieve_id_with_name('project-metadata')
    assert((id.respond_to? :+))
  end

end
