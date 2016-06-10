class IngestWorkflowWebserviceClientTest



  # frozen_string_literal: true
  require 'test/unit'
  require_relative '../video_test'
  require_relative '../../lib/web_service_clients/workflow_clients/ingestion_workflow_webservice_client'

  class IngestionWorkflowWebserviceClientTest < VideoTest

    def setup
      @ingest_workflow_ws_client = IngestionWorkflowWebserviceClient.new
    end

    def test_create_valid_ingestion
      workflow = @ingest_workflow_ws_client.create_workflow
      # assert_respond_to(workflow, :has_key?)
      # assert(workflow.has_key?('id'))
    end

    def test_create_default_payload
      # payload = @ingest_workflow_ws_client.create_project_workflow_payload
      # assert_respond_to(payload, :has_key?)
      # assert(payload.has_key?(:definitionId))
    end

    def test_create_custom_payload
      # payload = @ingest_workflow_ws_client.create_project_workflow_payload('TEST', 'TEST', 'TEST')
      # payload_string_variables = payload[:stringVariables][:projectMetadata]
      # assert_respond_to(payload_string_variables, :=~)
      # assert(payload_string_variables =~ /"project": "TEST","section": "TEST", "brand": "TEST"/)
    end

  end


end