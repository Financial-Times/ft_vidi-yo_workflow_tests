require 'test/unit'
require_relative '../../lib/webservice_clients/workflows/ingest_workflow'

class IngestWorkflowTest < Test::Unit::TestCase


  def setup
    @ingest_workflow = IngestWorkflow.new.create
  end

  def test_project_is_not_empty
    assert_not_nil(@ingest_workflow)
  end

  def test_status_is_a_string
    assert_kind_of(String, @ingest_workflow.status)
  end

  def test_workflow_has_a_workflow_log
    assert_kind_of(Hash, @ingest_workflow.workflow_log)
  end

  def test_workflow_has_an_id
    assert_kind_of(Fixnum, @ingest_workflow.id)
  end

  def test_can_create_default_payload
    default_payload = @ingest_workflow.payload
    assert_kind_of(Hash, default_payload)
    assert(default_payload.has_key?(:stringVariables))
  end

end