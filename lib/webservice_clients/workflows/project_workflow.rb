# frozen_string_literal: true
require_relative '../workflow_clients/project_workflow_webservice_client'
require_relative 'workflow'

##
# Project Workflow
class ProjectWorkflow < Workflow

  attr_reader :workflow_log

  ##
  # Create new Project Workflow
  #
  # @return [ProjectWorkflow] object
  def create
    @workflow_log = ProjectWorkflowWebserviceClient.new.create_project_workflow
    raise "Workflow not created: #{@workflow_log['status']} found" unless created?
    self
  end


  ##
  # Retrieve definition using log url
  #
  # @return [Hash] project definition
  def definition(url)
    VideoWebserviceClient.new(WSUser.new, url)
                         .retrieve_resource
  end

  ##
  # Retrieve an existing ProjectWorkflow by id
  #
  # @param workflow_id [String]
  # @return [ProjectWorkflow] workflow
  def retrieve(workflow_id)
    @workflow_log = ProjectWorkflowWebserviceClient.new.retrieve_workflow(workflow_id)
    self
  end

  ##
  # Stores default payload from client
  #
  # @return [Hash] request payload
  def default_payload
    ProjectWorkflowWebserviceClient.new.create_project_workflow_payload
  end

  def uuid
    (retrieve id).workflow_log['definition']['uuid']
  end

end
