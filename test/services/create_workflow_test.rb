# frozen_string_literal: true
require 'test/unit'
require_relative '../test_helper'
require_relative '../video_test'
require_relative '../../lib/webservice_clients/workflow_clients/project_workflow_webservice_client'

class CreateWorkflowTest < VideoTest

  def setup
  end

  def test_create_project_workflow
    VCR.use_cassette 'unit test project' do
      @response = ProjectWorkflowWebserviceClient.new(WSUser.new, "#{MIO_ROOT_URL}/api/workflows/")
                                                 .create_project_workflow
    end

    info_logger :info, @response
    assert_respond_to(@response, :each_value)
    assert(!(@response.has_key? 'errors'))
    assert @response.has_key? 'href'
  end

end
