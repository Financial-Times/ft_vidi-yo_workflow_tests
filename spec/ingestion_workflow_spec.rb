# frozen_string_literal: true
require 'spec_helper'
require 'rspec/wait'
require 'vcr'
require_relative '../test/data/custom_request_data'
require_relative '../lib/webservice_clients/workflow_clients/ingestion_workflow_webservice_client'
require_relative '../lib/webservice_clients/workflows/ingest_workflow'
require_relative '../config/config'

RSpec.describe IngestWorkflow do
  include Config::Logging
  include Config::Constants

  before :all do
    @project_uuid = SecureRandom.uuid
    @project_uuid = SecureRandom.uuid
    info_logger :info, 'CREATED UUID: ' + @project_uuid
    @project_workflow_client = ProjectWorkflow.new
    @project = @project_workflow_client.create @project_uuid
    @ingestion = IngestWorkflow.new
  end

  it 'can indicate that the ingestion is complete', :vcr, wait: {timeout: 240} do
    @ingestion = @ingestion.create @project_uuid
    retrieved_ingestion = @ingestion.retrieve @ingestion.id
    wait_for_complete @ingestion, retrieved_ingestion
  end

end
