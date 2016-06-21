# frozen_string_literal: true
require_relative '../../../lib/webservice_clients/workflow_clients/ingestion_workflow_webservice_client'
require_relative '../../../config/config'

##
# Ingestion Workflow
class IngestionWorkflow

  include Config::Logging
  attr_reader :workflow_log

  ##
  # Create new Ingestion Workflow
  #
  # @return [IngestionWorkflow] object
  def create(live: false, payload: nil)
    @workflow_log = IngestionWorkflowWebserviceClient.new.create_ingestion_workflow
    puts @workflow_log
    # raise "Workflow not created: #{@workflow_log.class} found" unless created?
    self
  end

  ##
  # Check the ProjectWorkflow
  #
  # @return [boolean]
  def started?
    status == 'Running' || status == 'Complete'
  end

  def completed?
    # TODO: Refactor. Spaghetti.
    puts status
    info_logger :info, status
    if status == 'Failed'
      error_logger :error, 'Workflow failed'
      raise 'Workflow failed'
    end
    status =~ /Completed/
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
