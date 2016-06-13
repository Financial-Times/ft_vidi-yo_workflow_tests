# frozen_string_literal: true
require 'spec_helper'
require 'rspec/wait'
require_relative '../test/data/custom_request_data'
require_relative '../lib/web_service_clients/workflow_clients/ingestion_workflow_webservice_client'
require_relative '../lib/web_service_clients/workflows/ingestion_workflow'
require_relative '../config/config'

RSpec.describe IngestionWorkflow do
  include Config::Logging

  before :all do
    @workflow_client = IngestionWorkflow.new
  end

  before :each do
    @workflow = @workflow_client.create
  end

  context 'create workflow' do
    it 'can create a workflow', :vcr do
      expect(@workflow.created?).to be_truthy
      expect(@workflow.status).to eql 'Running'
    end
  end

  context 'a workflow has been created' do
    it 'can retrieve a previously-defined workflow', :vcr do
      @workflow = @workflow_client.create
      retrieved_workflow = @workflow_client.retrieve @workflow.id
      expect(retrieved_workflow.id).to match @workflow.id
    end
  end

  it 'can indicate that the workflow is complete', :vcr, wait: {timeout: 120} do
    retrieved_workflow = @workflow_client.retrieve @workflow.id

    wait_for do
      status = @workflow_client.retrieve(retrieved_workflow.id).status
      info_logger :info, 'Workflow status is: ' + status
      raise 'Workflow failed' if status =~ /Failed/
      status
    end
      .to eql 'Completed'
  end
end
