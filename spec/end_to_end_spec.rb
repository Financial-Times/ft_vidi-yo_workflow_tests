# frozen_string_literal: true
require_relative 'spec_helper'
require 'rspec/wait'
require_relative '../lib/webservice_clients/workflows/ingest_workflow'
require_relative '../lib/webservice_clients/workflows/project_workflow'
require_relative '../test/data/custom_request_data'
require_relative '../config/config'
require_relative '../lib/webservice_clients/workflows/end_to_end_workflow'

RSpec.describe EndToEndWorkflow do
  include Config::Logging

  before :each do
    @project_uuid = SecureRandom.uuid
    info_logger :info, 'CREATED UUID: ' + @project_uuid
    @project_workflow_client = ProjectWorkflow.new
    @project = @project_workflow_client.create @project_uuid
    expect(@project.uuid.contains_uuid?).to be_truthy
    wait_for_complete @project
  end

  it 'can retrieve metadata', :vcr, wait: {timeout: 120} do
    metadata = MetadataDescriptionWebserviceClient.new.retrieve_description_metadata
    expect(metadata).to respond_to :each
  end


  it 'can complete a project workflow', :vcr, wait: {timeout: 120} do
    true
  end

  it 'can complete an ingestion workflow', :vcr, wait: {timeout: 120} do
    ingestion_workflow_client = IngestWorkflow.new
    ingestion_workflow = ingestion_workflow_client.create @project_uuid
    retrieved_ingestion = ingestion_workflow.retrieve ingestion_workflow.id
    wait_for_complete retrieved_ingestion
  end

  it 'can complete a publish workflow', :vcr, wait: {timeout: 120} do
    publish_workflow_client = PublishWorkflow.new
    publish_workflow = publish_workflow_client.create @project_uuid
    retrieved_publish_workflow = publish_workflow.retrieve publish_workflow.id
    wait_for_complete retrieved_publish_workflow
  end


end
