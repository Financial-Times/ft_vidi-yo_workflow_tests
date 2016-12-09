require_relative 'spec_helper'
require_relative '../lib/webservice_clients/workflows/publish_workflow'
require_relative '../config/config'

RSpec.describe PublishWorkflow do
  include Config::Logging

  before :all do
    @project_uuid = SecureRandom.uuid
    info_logger :info, 'CREATED UUID: ' + @project_uuid
    @project_workflow_client = ProjectWorkflow.new
    @project = @project_workflow_client.create @project_uuid
    @publish_workflow_client = PublishWorkflow.new
    @publish_workflow = @publish_workflow_client.create @project_uuid
  end

  it 'can retrieve a previously-defined publish workflow', :vcr do
    retrieved_publish_workflow = @publish_workflow.retrieve @publish_workflow.id
    expect(retrieved_publish_workflow.id).to match @publish_workflow.id
  end

end