# frozen_string_literal: true
require_relative 'project_workflow'
require_relative 'ingest_workflow'

class IngestToPublish

  def create_project
    @project_workflow = ProjectWorkflow.new.create
    @project_workflow.uuid
  end

  def create_ingestion(uuid: create_project)
    @ingestion_workflow = IngestWorkflow.new
    @ingestion_workflow.create(uuid)
  end

end
