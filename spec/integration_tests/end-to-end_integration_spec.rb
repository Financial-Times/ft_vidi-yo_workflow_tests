require_relative '../../config/config'
require_relative '../../lib/webservice_clients/workflows/ingest_to_publish'

RSpec.describe IngestToPublish do

  include Config::Logging

  before :all do
    raise 'Not implemented'
    @project = ProjectWorkflow.new.create
    @uuid = @project.uuid
    info_logger :info, "Project ID: #{@uuid}"
  end

  it 'can create an ingestion' do
    @ingestion = IngestToPublish.new.create_ingestion(@uuid)
    info_logger :info, "INGESTION: #{@ingestion}"
    info_logger :info, "STATUS: #{@ingestion.status}"
    expect(@ingestion.started?).to be_truthy
  end

  it 'confirms that the ingestion was successful', wait: {timeout: 120} do
    @ingestion = IngestToPublish.new.create_ingestion(@uuid)
    retrieved_workflow = @ingestion.retrieve @ingestion.id
    wait_for do
      ingestion_status = @ingestion.retrieve(retrieved_workflow.id).status
      info_logger :info, ingestion_status
      ingestion_status
    end
        .to eql 'Complete'

  end

end