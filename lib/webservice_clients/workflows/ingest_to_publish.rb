# frozen_string_literal: true
require_relative '../../../spec/spec_helper'
require_relative 'project_workflow'
require_relative 'ingest_workflow'
require_relative 'publish_workflow'

class IngestToPublish

  include Config::Logging

  def create_project
    @project_workflow = ProjectWorkflow.new.create
    retrieved_project = @project_workflow.retrieve @project_workflow.id
    wait_for_complete @project_workflow, retrieved_project
    @project_workflow.uuid
  end

  def create_ingestion(uuid: create_project)
    @ingestion_workflow = IngestWorkflow.new
    @ingestion_workflow.create(uuid)
  end

  def do_publish
    @publish_workflow = PublishWorkflow.new
    @publish_workflow.create
  end

end
