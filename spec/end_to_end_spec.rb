# frozen_string_literal: true
require_relative 'spec_helper'
require 'rspec/wait'
require_relative '../lib/webservice_clients/workflows/ingestion_workflow'
require_relative '../lib/webservice_clients/workflows/project_workflow'
require_relative '../test/data/custom_request_data'
require_relative '../config/config'
require_relative '../lib/webservice_clients/workflows/ingest_to_publish'

RSpec.describe IngestToPublish do
  include Config::Logging

  before :all do
    VCR.use_cassette 'new project workflow' do
      @project = ProjectWorkflow.new.create
    end
    VCR.use_cassette 'uuid' do
      @uuid = @project.uuid
    end
    info_logger :info, "Project ID: #{@uuid}"
  end

  it 'can create an ingestion', :vcr do
    @ingestion = IngestToPublish.new.create_ingestion
    info_logger :info, "INGESTION: #{@ingestion}"
    info_logger :info, "STATUS: #{@ingestion.status}"
    expect(@ingestion.started?).to be_truthy
  end

  it 'confirms that the ingestion was successful', :vcr, wait: {timeout: 120} do
    @ingestion = IngestToPublish.new.create_ingestion(uuid: @uuid)
    retrieved_workflow = @ingestion.retrieve @ingestion.id
    wait_for_complete @ingestion, retrieved_workflow
  end
end
