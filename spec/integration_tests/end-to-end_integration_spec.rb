require_relative '../../config/config'
require_relative '../../lib/webservice_clients/workflows/ingest_to_publish'
require 'rspec/wait'

RSpec.describe IngestToPublish do

  include Config::Logging

  context 'live integration tests' do

    before :all do
      @project = ProjectWorkflow.new.create live:true
      @uuid = @project.uuid
      info_logger :info, "Project ID: #{@uuid}"
    end

    it 'can create a project' do
      expect(@project.created?).to be_truthy
    end

    it 'can create an ingestion' do
      @ingestion = IngestToPublish.new.create_ingestion(uuid: @uuid, live:true)
      info_logger :info, "INGESTION: #{@ingestion}"
      info_logger :info, "STATUS: #{@ingestion.status}"
      expect(@ingestion.started?).to be_truthy
    end

    it 'confirms that the ingestion was successful', wait: {timeout: 120} do
      @ingestion = IngestToPublish.new.create_ingestion(uuid: @uuid, live:true)
      retrieved_workflow = @ingestion.retrieve @ingestion.id
      wait_for do
        sleep 5
        ingestion_status = @ingestion.retrieve(retrieved_workflow.id).status
        info_logger :info, ingestion_status
        ingestion_status
      end
          .to match /Complete/

    end

  end


end