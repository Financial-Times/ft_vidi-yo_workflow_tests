# frozen_string_literal: true
require_relative '../workflow_clients/project_workflow_webservice_client'

##
# Project Workflow
class ProjectWorkflow

  attr_reader :workflow_log

  ##
  # Create new Project Workflow
  #
  # @return [ProjectWorkflow] object
  def create(_payload=nil)
    @workflow_log = ProjectWorkflowWebserviceClient.new.create_project_workflow
    raise "Workflow not created: #{@workflow_log.class} found" unless created?
    self
  end

  ##
  # Check the ProjectWorkflow
  #
  # @return [boolean]
  def created?
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
  # Retrieve the link to the log record
  #
  # @param project [Hash]
  # @return String url of log record
  def log_url(project)
    project['href']
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
    @workflow_log = ProjectWorkflowWebserviceClient.new.retrieve_workflow(workflow_id)
    self
  end

  def uuid
    (retrieve self.id).workflow_log['definition']['uuid']
  end

  ##
  # Stores default payload from client
  #
  # @return [Hash] request payload
  def default_payload
    ProjectWorkflowWebserviceClient.new.create_project_workflow_payload
  end

end
