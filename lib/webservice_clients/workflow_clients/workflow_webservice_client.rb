# frozen_string_literal: true
require 'ft_video_webservice_client'

##
# Handles workflow operations
class WorkflowWebserviceClient < VideoWebserviceClient

  ##
  # Create workflow with payload from subclass
  #
  # @param payload [JSON object as String]
  # Return [Hash] response to Web Service call
  def create_workflow(payload)
    info_logger :info, "#{self.class} payload is #{payload}"
    create_resource payload
  end

  ##
  # Retrieve an existing ProjectWorkflow by id
  #
  # @param id [String]
  # @return [Hash] workflow description
  def retrieve_workflow(id)
    @url = "#{@url}/#{id}"
    retrieve_resource
  end

end
