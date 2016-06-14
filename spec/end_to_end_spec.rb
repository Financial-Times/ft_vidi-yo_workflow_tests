require 'spec_helper'
require 'rspec/wait'
require_relative '../lib/web_service_clients/workflows/ingestion_workflow'
require_relative '../lib/web_service_clients/workflows/project_workflow'
require_relative '../test/data/custom_request_data'
require_relative '../config/config'
require_relative '../lib/web_service_clients/workflows/ingest_to_publish'

RSpec.describe IngestToPublish do

  include Config::Logging

  before :all do
    @project = ProjectWorkflow.new.create
  end

  it 'creates an ingestion' do
    uuid = @project.uuid
    info_logger :info, "ACTUAL #{uuid}"
    @ingestion = IngestToPublish.new.create_ingestion(uuid)
    info_logger :info, "EXPECTED: #{@ingestion[:stringVariables][:projectUUID]}"
    expect(@ingestion[:stringVariables][:projectUUID]).to match uuid
  end


end