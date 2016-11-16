# frozen_string_literal: true
require_relative '../spec_helper'
require_relative '../../config/config'
require_relative '../../lib/webservice_clients/workflows/end_to_end_workflow'
require 'rspec/wait'

RSpec.describe EndToEndWorkflow do
  include Config::Logging

  context 'live integration testing' do
    it 'can publish' do
      workflow = EndToEndWorkflow.new
      @ingest_workflow = workflow.create_ingestion
      @publish_workflow = workflow.do_publish
      retrieved_publish_workflow = @publish_workflow.retrieve @publish_workflow.id
      wait_for_complete @publish_workflow, retrieved_publish_workflow
    end
  end


end