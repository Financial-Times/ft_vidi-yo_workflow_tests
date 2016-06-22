require_relative 'spec_helper'
require_relative '../lib/webservice_clients/workflows/publish_workflow'
require_relative '../config/config'

RSpec.describe PublishWorkflow do
  include Config::Logging

  before :all do
    @publish_workflow_client = PublishWorkflow.new
  end

  before :each do
    @publish_workflow = @publish_workflow_client.create
  end

  it 'can create a publish workflow' do
    expect(@publish_workflow.started?).to be_truthy
  end

  it 'can retrieve a previously-defined publish workflow' do
    retrieved_publish_workflow = @publish_workflow.retrieve @publish_workflow.id
    expect(retrieved_publish_workflow.id).to match @publish_workflow.id
  end

  it 'can indicate that the publish workflow is complete', wait: {timeout: 240} do
    retrieved_publish_workflow = @publish_workflow.retrieve @publish_workflow.id
    wait_for_complete @publish_workflow, retrieved_publish_workflow
  end

end