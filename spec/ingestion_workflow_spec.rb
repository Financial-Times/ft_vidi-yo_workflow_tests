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
    @ingestion = IngestWorkflow.new
  end

  it 'can indicate that the ingestion is complete', :vcr, wait: {timeout: 240} do
    @ingestion = @ingestion.create
    retrieved_ingestion = @ingestion.retrieve @ingestion.id
    wait_for_complete @ingestion, retrieved_ingestion
  end

end
