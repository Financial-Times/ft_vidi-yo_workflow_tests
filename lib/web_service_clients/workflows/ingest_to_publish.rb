require_relative 'project_workflow'
require_relative 'ingestion_workflow'

class IngestToPublish

  def create_project
    @project_workflow = ProjectWorkflow.new.create
    puts "ACTUAL: #{@project_workflow.uuid}"
    @project_workflow.uuid
  end


  def create_ingestion(uuid=create_project)
    @ingestion_workflow = IngestionWorkflow.new
    @ingestion_workflow.payload(params={uuid: uuid, path: nil, title: nil})
  end

end