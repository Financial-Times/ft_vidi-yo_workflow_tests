require_relative '../../../lib/webservice_clients/workflow_clients/publish_workflow_webservice_client'
require_relative 'workflow'
require_relative '../../../config/config'


class PublishWorkflow < Workflow

  attr_reader :workflow_log

  ##
  # Retrieve an existing ProjectWorkflow by id
  #
  # @param workflow_id [String]
  # @return [ProjectWorkflow] workflow
  def retrieve(workflow_id)
    @workflow_log = PublishWorkflowWebserviceClient.new.retrieve_workflow(workflow_id)
    self
  end

  def create(uuid)
    @workflow_log = PublishWorkflowWebserviceClient.new.create_publish_workflow uuid
    self
  end

end