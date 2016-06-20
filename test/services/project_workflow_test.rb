# frozen_string_literal: true
require 'test/unit'
require_relative '../../lib/webservice_clients/workflows/project_workflow'
require_relative '../test_helper'

class ProjectWorkflowTest < Test::Unit::TestCase

  def setup
    VCR.use_cassette 'unit new project workflow' do
      @project_workflow = ProjectWorkflow.new.create
    end
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

  def test_can_create_default_payload
    default_payload = @project_workflow.default_payload
    assert_kind_of(Hash, default_payload)
    assert(default_payload.has_key?(:stringVariables))
  end

end
