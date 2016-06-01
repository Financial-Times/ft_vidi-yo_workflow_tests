# frozen_string_literal: true
require 'test/unit'
require_relative '../mio_test'
require_relative '../../lib/web_service_clients/workflow_clients/project_workflow_webservice_client'

class CreateWorkflowTest < MioTest

  def setup
  end

  def test_create_project_workflow
    response = ProjectWorkflowWebserviceClient.new(WSUser.new, "#{MioConstants::ROOT_URL}/api/workflows/")
                                              .create_project_workflow
    puts response
    assert_respond_to(response, :each_value)
    assert(!(response.has_key? 'errors'))
    assert response.has_key? 'href'
  end

end
