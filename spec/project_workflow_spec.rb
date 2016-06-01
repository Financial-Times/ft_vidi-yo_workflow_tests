# frozen_string_literal: true
require 'rspec'
require_relative '../lib/web_service_clients/workflows/project_workflow'

RSpec.describe ProjectWorkflow do
  it 'can create a workflow' do
    workflow = ProjectWorkflow.new.create
    expect(workflow.created?).to be_truthy
    expect(workflow.status).to eql 'Running'
  end

  it 'can retrieve a previously-defined workflow' do
    workflow = ProjectWorkflow.new.create
    retrieved_workflow = ProjectWorkflow.new.retrieve workflow.id
    expect(retrieved_workflow.id).to match workflow.id
  end
end
