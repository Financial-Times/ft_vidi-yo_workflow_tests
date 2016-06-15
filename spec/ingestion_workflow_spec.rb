# frozen_string_literal: true
require 'spec_helper'
require 'rspec/wait'
require 'vcr'
require_relative '../test/data/custom_request_data'
require_relative '../lib/web_service_clients/workflow_clients/ingestion_workflow_webservice_client'
require_relative '../lib/web_service_clients/workflows/ingestion_workflow'
require_relative '../config/config'

RSpec.describe IngestionWorkflow do
  include Config::Logging
  include Config::Constants

  before :all do
    @ingestion = IngestionWorkflow.new
  end

  before :each do
    @ingestion = @ingestion.create
  end

  context 'create ingestion' do
    it 'can create an ingestion', :vcr do
      expect(@ingestion.started?).to be_truthy
    end
  end

  context 'an ingestion has been created' do
    it 'can retrieve a previously-defined ingestion', :vcr do
      @ingestion = @ingestion .create
      retrieved_workflow = @ingestion.retrieve @ingestion .id
      expect(retrieved_workflow.id).to match @ingestion.id
    end
  end

  it 'can indicate that the ingestion is complete', wait: {timeout: 120} do
    retrieved_workflow = @ingestion.retrieve @ingestion.id

    wait_for do
      status = @ingestion.retrieve(retrieved_workflow.id).status
      info_logger :info, "Workflow retrieved: #{retrieved_workflow.workflow_log}"
      info_logger :info, 'Workflow status is: ' + status
      status
    end
        .to eql 'Complete'
  end

end

