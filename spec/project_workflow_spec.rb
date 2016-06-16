# frozen_string_literal: true
require 'spec_helper'
require_relative '../test/data/custom_request_data'
require_relative '../lib/webservice_clients/workflows/project_workflow'
require_relative '../config/config'

RSpec.describe ProjectWorkflow, :vcr => { :allow_unused_http_interactions => false } do
  include Config::Logging

  describe 'create_project_workflow_spec', :vcr do
    before :all do
      @workflow = ProjectWorkflow.new
    end

    before :each do
      @workflow = @workflow.create
    end

    it 'can create a workflow' do
      expect(@workflow.created?).to be_truthy
    end

    it 'can retrieve a previously-defined workflow' do
      @workflow = @workflow.create
      retrieved_workflow = @workflow.retrieve @workflow.id
      expect(retrieved_workflow.id).to match @workflow.id
    end

    it 'can indicate that the workflow is complete' do
      retrieved_workflow = @workflow.retrieve @workflow.id

      wait_for do
        status = @workflow.retrieve(retrieved_workflow.id).status
        info_logger :info, 'Workflow status is: ' + status
        status
      end
        .to eql 'Completed'
    end

    it 'has a uuid' do
      expect((@workflow.uuid).contains_uuid?).to be_truthy
    end
  end

end
