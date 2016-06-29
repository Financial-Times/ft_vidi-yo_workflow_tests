# frozen_string_literal: true
require 'test/unit'
require_relative '../video_test'
require_relative '../../lib/webservice_clients/workflow_clients/ingestion_workflow_webservice_client'


class IngestionWorkflowWebserviceClientTest < VideoTest

  def setup
    @ingest_workflow_ws_client = IngestionWorkflowWebserviceClient.new
  end

  def test_can_create_valid_ingestion_workflow
    VCR.use_cassette 'unit create valid ingestion' do
      @workflow = @ingest_workflow_ws_client.create_ingestion_workflow
    end
    assert_respond_to(@workflow, :has_key?)
    assert(@workflow.has_key?('id'))
  end

  def test_can_create_default_payload
    payload = @ingest_workflow_ws_client.create_ingestion_workflow_payload
    assert_respond_to(payload, :has_key?)
    assert(payload.has_key?(:definitionId))
  end

  def test_can_create_custom_payload
    payload = @ingest_workflow_ws_client.create_ingestion_workflow_payload(uuid: 'TEST', path: 'TEST', title: 'TEST')
    asset = payload[:stringVariables]
    info_logger :info, "Payload: #{payload}"
    info_logger :info, "Asset: #{asset}"
    assert_respond_to(asset, :=~)
    assert(asset.has_value?('TEST'))
  end

end

