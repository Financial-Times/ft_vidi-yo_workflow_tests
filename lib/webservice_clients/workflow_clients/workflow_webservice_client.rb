# frozen_string_literal: true
require_relative '../../../lib/webservice_clients/video_webservice_client'

##
# Handles workflow operations
class WorkflowWebserviceClient < VideoWebserviceClient

  ##
  # Create workflow with payload from subclass
  #
  # @param payload [JSON object as String]
  # @param live [Boolean] use mock?
  # Return [Hash] response to Web Service call
  # TODO: Refactor to use polymorphism, not boolean
  def create_workflow(payload, live=false)
    if(live)
      live_create_resource payload
    else
      create_resource payload
    end
  end

  ##
  # Retrieve an existing ProjectWorkflow by id
  #
  # @param id [String]
  # @return [Hash] workflow description
  def retrieve_workflow(id)
    @url = "#{@url}#{id}"
    retrieve_resource
  end

end
