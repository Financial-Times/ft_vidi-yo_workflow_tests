# frozen_string_literal: true
require 'spec_helper'
require_relative '../test/data/custom_request_data'
require_relative '../lib/webservice_clients/workflows/project_workflow'
require_relative '../config/config'

RSpec.describe ProjectWorkflow do
  include Config::Logging

  describe 'create_project_workflow_spec', :vcr do
    before :all do
      @project_workflow_client = ProjectWorkflow.new
    end

    it 'can complete a project workflow', :vcr, wait: {timeout: 120} do
      project = @project_workflow_client.create
      expect(project.uuid.contains_uuid?).to be_truthy
      retrieved_project = project.retrieve project.id
      wait_for_complete project, retrieved_project
    end

  end
end
