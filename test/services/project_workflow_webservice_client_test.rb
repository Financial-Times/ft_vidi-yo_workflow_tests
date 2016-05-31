require 'test/unit'
require_relative '../../lib/web_service_clients/workflows/project_workflow'

class ProjectWorkflowWebserviceClientTest < Test::Unit::TestCase

  def setup
    @project_workflow = ProjectWorkflow.new
  end

  def test_create_project
    assert_not_nil(@project_workflow)
  end

end