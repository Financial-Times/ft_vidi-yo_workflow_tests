require_relative 'mio_create_workflow_webservice_client'

##
# Handles creation of Project Workflows
class MioCreateProjectWorkflowWebserviceClient < MioCreateWorkflowWebserviceClient

  def initialize(user=WSUser.new, url)
    super
    @object_type = :project_workflow
  end

  # Builds the payload to create a project workflow
  #
  # @param project_name [String] project name. Must be unique within mio
  # @return [Hash] payload for RestClient to convert to JSON and pass to Mio to create workflow
  def create_project_workflow_payload(project_name=random_string(6))
    {
        definitionId: 12387,
        stringVariables: {projectMetadata: ("{\"project\": \"#{project_name}\","\
        "\"<section>\": \"#{MioConstants::DEFAULT_SECTION}\","\
         "\"brand\": \"#{MioConstants::DEFAULT_BRAND}\"}")}
    }
  end

  # Wrapper to create project with self.create_project_workflow_payload
  #
  # @return [Hash] created project object converted from JSON service response
  def create_project
      create_resource(create_project_workflow_payload)
  end


end