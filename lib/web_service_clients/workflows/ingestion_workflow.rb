# frozen_string_literal: true
require_relative '../../../lib/web_service_clients/workflow_clients/ingestion_workflow_webservice_client'

##
# Ingestion Workflow
class IngestionWorkflow

  attr_reader :workflow_log

  ##
  # Create new Ingestion Workflow
  #
  # @return [IngestionWorkflow] object
  def create(_payload=nil)
    @workflow_log = IngestionWorkflowWebserviceClient.new.create_ingestion_workflow
    puts @workflow_log
    # raise "Workflow not created: #{@workflow_log.class} found" unless created?
    self
  end

  ##
  # Check the ProjectWorkflow
  #
  # @return [boolean]
  def created?
    puts status
    status == 'Running' || status == 'Completed'
  end

  ##
  # Retrieve the link to the log record
  #
  # @return String status of workflow
  def status
    @workflow_log['status']
  end

  ##
  # Retrieve id for created object
  #
  # @return [Fixnum] id
  def id
    @workflow_log['id']
  end

  ##
  # Retrieve an existing ProjectWorkflow by id
  #
  # @param workflow_id [String]
  # @return [ProjectWorkflow] workflow
  def retrieve(workflow_id)
    @workflow_log = IngestionWorkflowWebserviceClient.new.retrieve_workflow(workflow_id)
    self
  end

  def payload(params={uuid: nil, path: nil, title: nil})
    IngestionWorkflowWebserviceClient.new.create_ingestion_workflow_payload(params)
  end

end
