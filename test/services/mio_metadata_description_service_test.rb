require 'test/unit'
require_relative '../test_helper'
require_relative '../../lib/services/mio_metadata_description_service'
require_relative '../../test/data/ws_user'

class MioMetadataDescriptionServiceTest < MioTest

  def setup
    @mio_metadata_service = MioMetadataDescriptionService.new(WSUser.new)
    @mio_metadata_service_failed = MioMetadataDescriptionService.new(WSUser.new, 'https://master.dev.nativ-systems.com/api/metadataDefinitons')
  end

  def test_retrieves_description_config
    response = @mio_metadata_service.retrieve_descriptions
    assert((response.respond_to? :each_key), "Data returned in invalid format (#{response.class})")
    assert((response.has_key? 'metadataDefinitions'), 'data returned has no definitions')
  end

  def test_uses_backup_if_ws_not_available
    response = @mio_metadata_service_failed.retrieve_descriptions
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
