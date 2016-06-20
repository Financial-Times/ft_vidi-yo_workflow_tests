# frozen_string_literal: true
require 'spec_helper'
require 'rspec/wait'
require 'vcr'
require_relative '../test/data/custom_request_data'
require_relative '../lib/webservice_clients/workflow_clients/ingestion_workflow_webservice_client'
require_relative '../lib/webservice_clients/workflows/ingestion_workflow'
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

  context 'create ingestion', :vcr do
    it 'can create an ingestion' do
      expect(@ingestion.started?).to be_truthy
    end
  end

  context 'an ingestion has been created', :vcr do
    it 'can retrieve a previously-defined ingestion' do
      @ingestion = @ingestion .create
      retrieved_workflow = @ingestion.retrieve @ingestion .id
      expect(retrieved_workflow.id).to match @ingestion.id
    end
  end

  context 'end-to-end testing', :vcr do
    it 'can indicate that the ingestion is complete', :vcr, wait: {timeout: 240} do
      retrieved_ingestion = @ingestion.retrieve @ingestion.id
      wait_for_complete @ingestion, retrieved_ingestion
    end
  end

end

