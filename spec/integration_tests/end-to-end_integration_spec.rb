# frozen_string_literal: true
require_relative '../spec_helper'
require_relative '../../config/config'
require_relative '../../lib/webservice_clients/workflows/ingest_to_publish'
require 'rspec/wait'

RSpec.describe IngestToPublish do
  include Config::Logging

  before :all do
    @project = ProjectWorkflow.new.create
    @uuid = @project.uuid
    info_logger :info, "Project ID: #{@uuid}"
  end

  it 'can create an ingestion' do
    @ingestion = IngestToPublish.new.create_ingestion
    info_logger :info, "INGESTION: #{@ingestion}"
    info_logger :info, "STATUS: #{@ingestion.status}"
    expect(@ingestion.started?).to be_truthy
  end

  it 'confirms that the ingestion was successful', wait: {timeout: 120} do
    @ingestion = IngestToPublish.new.create_ingestion
    retrieved_ingestion = @ingestion.retrieve @ingestion.id
    wait_for_complete @ingestion, retrieved_ingestion
  end

  it 'can publish' do
    @publish_workflow = IngestToPublish.new.do_publish
    retrieved_publish_workflow = @publish_workflow.retrieve @publish_workflow.id
    wait_for_complete @publish_workflow, retrieved_publish_workflow
  end

end