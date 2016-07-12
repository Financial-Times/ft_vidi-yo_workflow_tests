# frozen_string_literal: true
require_relative '../../../lib/webservice_clients/workflow_clients/ingestion_workflow_webservice_client'
require_relative '../../../config/config'
require_relative 'workflow'
require 'vcr'
require_relative '../../../vcr_setup'

##
# Ingestion Workflow
class IngestWorkflow < Workflow

  include Config::Logging
  attr_reader :workflow_log

  ##
  # Create new Ingestion Workflow
  #
  # @return [IngestWorkflow] object
  def create(uuid=nil)
      @workflow_log = IngestionWorkflowWebserviceClient
                          .new
                          .create_ingestion_workflow({uuid: uuid, path: nil, title: nil})
    info_logger :info, @workflow_log
    raise "Workflow not created: #{@workflow_log.class} found" unless created?
    self
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
