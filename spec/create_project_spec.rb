require_relative '../lib/web_service_clients/workflows/project_workflow'

RSpec.describe ProjectWorkflow do
  it 'Creates a workflow' do
    workflow = ProjectWorkflow.new
    expect(workflow.created?).to be_truthy
  end
end