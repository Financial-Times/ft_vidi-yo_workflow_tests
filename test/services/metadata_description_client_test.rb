# frozen_string_literal: true
require 'test/unit'
require_relative '../test_helper'
require_relative '../../lib/ft_video_webservice_client/ft_video_webservice_client'
require_relative '../../test/data/ws_user'

class MetadataDescriptionClientTest < VideoTest

  def setup
    @mio_metadata_service = MetadataDescriptionWebserviceClient.new(WSUser.new)
  end

  def test_retrieves_description_config
    VCR.use_cassette 'metadata description' do
      @response = @mio_metadata_service.retrieve_description_metadata
    end
    assert((@response.respond_to? :each_key), "Data returned in invalid format (#{@response.class})")
    assert((@response.has_key? 'metadataDefinitions'), 'data returned has no definitions')
  end

  def test_can_retrieve_description_by_name
    VCR.use_cassette 'metadata description project-metadata' do
      @description = @mio_metadata_service.retrieve_description_by_name(PROJECT_METADATA_NAME)
    end
    assert((@description['name'] == PROJECT_METADATA_NAME), "Name in response incorrect (#{@description['name']})")
  end

  def test_can_retrieve_id_with_name
    VCR.use_cassette 'metadata description project-metadata by id' do
      @id = @mio_metadata_service.retrieve_id_with_name(PROJECT_METADATA_NAME)
    end
    assert((@id.respond_to? :+))
  end

end
