require_relative '../spec_helper'
require_relative '../../config/config'
require_relative '../../lib/webservice_clients/workflows/end_to_end_workflow'
require 'rspec'


RSpec.describe 'concurrency' do
  include Config::Logging
  CONCURRENCY_LEVEL=2

  before :each do
    @workflows_created = []
    @ingestion_workflow_client = IngestWorkflow.new
    @publish_workflow_client = PublishWorkflow.new
    @project_workflow_client = ProjectWorkflow.new
    @project_uuid = SecureRandom.uuid
    info_logger :info, 'CREATED UUID: ' + @project_uuid
    @project = @project_workflow_client.create @project_uuid
    expect(@project.uuid.contains_uuid?).to be_truthy
    wait_for_complete @project
  end

  it 'can create projects concurrently' do
    @expected_complete_workflows = CONCURRENCY_LEVEL
    CONCURRENCY_LEVEL.times do
      project_uuid = SecureRandom.uuid
      project_workflow = @project_workflow_client.create project_uuid
      retrieved_project_workflow = project_workflow.retrieve project_workflow.id
      @workflows_created << retrieved_project_workflow
    end
  end

  it 'can create ingestions concurrently' do
    @expected_complete_workflows = CONCURRENCY_LEVEL
    CONCURRENCY_LEVEL.times do
      ingest_workflow = @ingestion_workflow_client.create @project_uuid
      retrieved_ingest_workflow = ingest_workflow.retrieve ingest_workflow.id
      @workflows_created << retrieved_ingest_workflow
    end
  end

  it 'can publish concurrently' do
    @expected_complete_workflows = CONCURRENCY_LEVEL
    CONCURRENCY_LEVEL.times do
      publish_workflow = @publish_workflow_client.create @project_uuid
      retrieved_publish_workflow = publish_workflow.retrieve publish_workflow.id
      @workflows_created << retrieved_publish_workflow
    end
  end

  it 'can run concurrent end-to-end workflows' do
    #TODO far too long. Refactor.
    @expected_complete_workflows = CONCURRENCY_LEVEL * 2
    CONCURRENCY_LEVEL.times do
      ingestion_workflow = @ingestion_workflow_client.create @project_uuid
      retrieved_ingestion_workflow = ingestion_workflow.retrieve ingestion_workflow.id
      @workflows_created << retrieved_ingestion_workflow
      publish_workflow = @publish_workflow_client.create @project_uuid
      retrieved_publish_workflow = publish_workflow.retrieve publish_workflow.id
      @workflows_created <<  retrieved_publish_workflow
      info_logger :info, """Stored workflow #{publish_workflow.id}
#{@workflows_created}"""
    end
  end

  after :each do
    #TODO far too long. Refactor.
    info_logger :info, "#{@workflows_created.length} workflows created. checking success."
    count = @workflows_created.length

    @workflows_created.each do |workflow|
      info_logger :info, "Workflows created. Waiting for workflow id #{workflow}"
      wait_for_complete workflow
      count = count - 1
      info_logger :info, "#{count} Workflows remaining"
    end
    info_logger :info, "Soak test complete. #{@workflows_created.length} complete of #{@expected_complete_workflows}"
    expect(@workflows_created.length).to eq @expected_complete_workflows
  end
end
