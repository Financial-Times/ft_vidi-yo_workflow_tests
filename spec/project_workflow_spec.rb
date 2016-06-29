# frozen_string_literal: true
require 'spec_helper'
require_relative '../test/data/custom_request_data'
require_relative '../lib/webservice_clients/workflows/project_workflow'
require_relative '../config/config'

RSpec.describe ProjectWorkflow do
  include Config::Logging

  describe 'create_project_workflow_spec', :vcr do
    before :all do
      @project = ProjectWorkflow.new
    end

    before :each do
      @project = @project.create
    end

    it 'can create a project', :vcr do
      expect(@project.created?).to be_truthy
    end

    it 'can retrieve a previously-defined project', :vcr do
      @project = @project.create
      retrieved_project = @project.retrieve @project.id
      expect(retrieved_project.id).to match @project.id
    end

    it 'can indicate that the workflow is complete', :vcr, wait: {timeout: 120} do
      retrieved_project = @project.retrieve @project.id
      wait_for_complete @project, retrieved_project
    end

    it 'has a uuid', :vcr do
      expect(@project.uuid.contains_uuid?).to be_truthy
    end
  end
end
