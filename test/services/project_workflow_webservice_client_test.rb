# frozen_string_literal: true
require 'test/unit'
require_relative '../../lib/web_service_clients/workflows/project_workflow'

class ProjectWorkflowWebserviceClientTest < Test::Unit::TestCase

  def setup
    @project_workflow = ProjectWorkflow.new.create
  end

  def test_created
    ProjectWorkflow.new.create
  end

  def test_project_is_not_empty
    assert_not_nil(@project_workflow)
  end

  def test_status_is_a_string
    assert_kind_of(String, @project_workflow.status)
  end

  def test_workflow_has_a_workflow_log
    assert_kind_of(Hash, @project_workflow.workflow_log)
  end

  def test_workflow_has_an_id
    assert_kind_of(Fixnum, @project_workflow.id)
  end

end
