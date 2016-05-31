require_relative '../workflow_clients/project_workflow_webservice_client'


##
# Project Workflow
class ProjectWorkflow

  attr_reader :workflow

  def initialize
    @workflow = ProjectWorkflowWebserviceClient.new.create_project_workflow
    raise "Workflow not created: #{@workflow.class} found" unless created?
    self
  end

  #

  def created?
   MioWebserviceClient.new(WSUser.new, log_url(@workflow))
       .retrieve_resource['name'] == 'workflow-create-project'
  end

  def status
    @workflow['status']
  end

  ##
  # Retrieve the link to the log record
  #
  # @param project [Hash]
  # @return String url of log record
  def log_url(project)
    project['href']
  end

end