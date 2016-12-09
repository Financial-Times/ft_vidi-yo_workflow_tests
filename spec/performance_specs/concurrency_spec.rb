require_relative '../spec_helper'
require_relative '../../config/config'
require_relative '../../lib/webservice_clients/workflows/end_to_end_workflow'
require 'rspec'


RSpec.describe 'concurrency' do
  include Config::Logging
  CONCURRENCY_LEVEL=20
  EXPECTED_COMPLETE_WORKFLOWS = CONCURRENCY_LEVEL * 2

  describe 'publish concurrently' do

    before :each do
      @project_uuid = SecureRandom.uuid
      info_logger :info, 'CREATED UUID: ' + @project_uuid
      @project_workflow_client = ProjectWorkflow.new
      @project = @project_workflow_client.create @project_uuid
      expect(@project.uuid.contains_uuid?).to be_truthy
      retrieved_project = @project.retrieve @project.id
      wait_for_complete @project, retrieved_project
    end

    it 'can run concurrent workflows' do
      #TODO far too long. Refactor.
      workflows_created = {}
      CONCURRENCY_LEVEL.times do
        ingestion_workflow_client = IngestWorkflow.new
        ingestion_workflow = ingestion_workflow_client.create @project_uuid
        retrieved_ingestion_workflow = ingestion_workflow.retrieve ingestion_workflow.id
        workflows_created[ingestion_workflow] = retrieved_ingestion_workflow
        publish_workflow_client = PublishWorkflow.new
        publish_workflow = publish_workflow_client.create @project_uuid
        retrieved_publish_workflow = publish_workflow.retrieve publish_workflow.id
        workflows_created[publish_workflow] = retrieved_publish_workflow
        info_logger :info, """Stored workflow #{publish_workflow.id}
#{workflows_created}"""
      end
      info_logger :info, "#{workflows_created.length} workflows created. checking success."
      workflows_created.each do |k, v|
        workflow = k
        retrieved_workflow = v
        info_logger :info, "Workflows created. Waiting for workflow id #{workflow.id}"
        wait_for_complete workflow, retrieved_workflow
      end
      info_logger :info, "Soak test complete. #{workflows_created.length} complete of #{EXPECTED_COMPLETE_WORKFLOWS}"
      expect(workflows_created.length).to eq EXPECTED_COMPLETE_WORKFLOWS
    end

  end
end
