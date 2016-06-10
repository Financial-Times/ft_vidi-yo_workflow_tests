# frozen_string_literal: true
require 'test/unit'
require_relative '../video_test'
require_relative '../../config/config'
require_relative '../../lib/web_service_clients/workflow_clients/ingestion_workflow_webservice_client'

class IngestWorkflowWebserviceClientTest

  include Config::Logging

  class IngestionWorkflowWebserviceClientTest < VideoTest

    def setup
      @ingest_workflow_ws_client = IngestionWorkflowWebserviceClient.new
    end

    def test_create_valid_ingestion
      workflow = @ingest_workflow_ws_client.create_ingestion_workflow
      assert_respond_to(workflow, :has_key?)
      assert(workflow.has_key?('id'))
    end

    def test_create_default_payload
      payload = @ingest_workflow_ws_client.create_ingestion_workflow_payload
      assert_respond_to(payload, :has_key?)
      assert(payload.has_key?(:definitionId))
    end

    def test_create_custom_payload
      payload = @ingest_workflow_ws_client.create_ingestion_workflow_payload('TEST', 'TEST', 'TEST')
      asset = payload[:stringVariables]
      info_logger :info, "Payload: #{payload}"
      info_logger :info, "Asset: #{asset}"
      assert_respond_to(asset, :=~)
      assert(asset.has_value?('TEST'))
    end

  end

end
