# frozen_string_literal: true
require 'spec_helper'
require_relative '../../test/data/custom_request_data'
require_relative '../../lib/webservice_clients/workflows/project_workflow'

RSpec.describe ProjectWorkflowWebserviceClient do
  before :all do
    @workflow = ProjectWorkflowWebserviceClient.new
  end

  it 'can handle malformed requests' do
    malformed_request = '</FAILED>'
    @response = @workflow.create_invalid_project_workflow(malformed_request,
                                                          malformed_request, malformed_request)
  end

  it 'can handle large requests' do
    big_request = CustomRequestData.extra_long_string(100_000)
    @response = @workflow.create_invalid_project_workflow(big_request, big_request, big_request)
  end

  after :each do
    expect(@response['status'] == 'Running' || @response['status'] == 'Complete').to be_truthy
  end
end
