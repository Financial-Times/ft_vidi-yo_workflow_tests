# frozen_string_literal: true
require_relative '../spec_helper'
require_relative '../../config/config'
require_relative '../../lib/webservice_clients/workflows/end_to_end_workflow'
require 'rspec/wait'

RSpec.describe EndToEndWorkflow do
  include Config::Logging

  # before :all do
  #   @project = ProjectWorkflow.new.create
  #   @uuid = @project.uuid
  #   info_logger :info, "Project ID: #{@uuid}"
  # end

  context 'live integration testing' do
    it 'can publish' do
      @publish_workflow = EndToEndWorkflow.new.do_publish
      retrieved_publish_workflow = @publish_workflow.retrieve @publish_workflow.id
      wait_for_complete @publish_workflow, retrieved_publish_workflow
    end
  end


end