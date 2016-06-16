require_relative 'project_workflow'
require_relative 'ingestion_workflow'

class IngestToPublish

  def create_project
    @project_workflow = ProjectWorkflow.new.create
    puts "ACTUAL: #{@project_workflow.uuid}"
    @project_workflow.uuid
  end


  def create_ingestion(uuid: create_project, live: false)
    @ingestion_workflow = IngestionWorkflow.new.create(payload:
      IngestionWorkflowWebserviceClient.new.create_ingestion_workflow_payload(params={uuid: uuid, path: nil, title: nil}))
    #@ingestion_workflow.create(:payload, live: false)
  end

end