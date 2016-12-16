require 'test/unit'
require 'rspec/expectations'
require_relative '../test_helper'
require_relative '../../test/data/ws_user'
require_relative '../../lib/webservice_clients/workflow_status_client'

class WorkflowStatusTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @workflow_status_client = WorkflowStatusClient.new(WSUser.new)
  end


  def test_client_is_instantiated
    assert_respond_to(@workflow_status_client, :retrieve_workflow_summary)
  end

  def test_workflow_summary_retrieved
    VCR.use_cassette 'retrieve workflow summary' do
    workflow_statuses = @workflow_status_client.retrieve_workflow_summary
      assert_respond_to(workflow_statuses, :each_key)
    end
  end

  def test_can_count_workflows
    workflow_count = @workflow_status_client.count_workflows_by_status('Cancelled')
    assert(workflow_count > 0)
  end

  def test_can_count_workflows_by_name
    project_summary_count = @workflow_status_client.count_workflows_by_name 'project-workflow'
    assert(project_summary_count > 0)
  end

end