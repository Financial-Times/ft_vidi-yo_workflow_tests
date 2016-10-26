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
    @ingestion = EndToEndWorkflow.new.create_ingestion
    info_logger :info, "INGESTION: #{@ingestion}"
    info_logger :info, "STATUS: #{@ingestion.status}"
    expect(@ingestion.started?).to be_truthy
  end

  it 'confirms that the ingestion was successful', :vcr, wait: {timeout: 120} do
    @ingestion = EndToEndWorkflow.new.create_ingestion
    retrieved_ingestion = @ingestion.retrieve @ingestion.id
    wait_for_complete @ingestion, retrieved_ingestion
  end

  it 'can publish', :vcr do
    @publish_workflow = EndToEndWorkflow.new.do_publish
    retrieved_publish_workflow = @publish_workflow.retrieve @publish_workflow.id
    wait_for_complete @publish_workflow, retrieved_publish_workflow
  end

end
