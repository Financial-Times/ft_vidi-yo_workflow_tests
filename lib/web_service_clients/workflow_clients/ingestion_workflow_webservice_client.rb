# frozen_string_literal: true
require_relative '../video_webservice_client'
require_relative '../../../test/data/ws_user'
require_relative '../../../test/data/custom_request_data'
require_relative 'workflow_webservice_client'

##
# Handles Ingestion workflow operations
class IngestionWorkflowWebserviceClient < WorkflowWebserviceClient

  def initialize(user=WSUser.new, url="#{MIO_ROOT_URL}/api/workflows/")
    super
    @object_type = :ingest__workflow
    @url = url
  end

  # Wrapper to create project with self.create_project_workflow_payload
  #
  # @return [Hash] created project object converted from JSON service response
  def create_ingestion_workflow
    create_workflow(create_ingestion_workflow_payload)
  end

  # Builds the payload to create an ingestion workflow
  #
  # @param uuid [String] project name. Must be unique within mio
  # @param path [String] url
  # @param title [String] url
  # @return [Hash] payload for RestClient to convert to JSON and create workflow
  # noinspection RubyInstanceMethodNamingConvention
  def create_ingestion_workflow_payload(uuid=nil, path=nil, title=nil)
    uuid ||= "06035926-2479-4f6a-bcfe-0f330d5b2815"
    path ||= "/FTArts_Birdsong_001.mp4"
    title ||= "FT Art Birdsong"

    {
      'definitionId':    13800,
      'stringVariables': {
        'assetMetadata': '{ "clip-type":"http://api.ft.com/things/a0e8ca2e-03b4-4321-9b50-4a85b38298cd",'\
'"clip-description": "FT Art Birdsong ", "location":"http://api.ft.com/things/f4ef81c6-765c-4f04-a8c7-b637f49f7e61",'\
'"interviewee": "Jem Rayfield","office": "http://api.ft.com/things/a29a5f4f-b4ff-46f7-b597-a30437783e1e",'\
'"producer": "http://api.ft.com/things/a4fda01e-dd90-490b-a7be-7c74eafd3884","freelance-producer": "James Condron",'\
'"reporter-1": "Darren Bown", "restrictions": "false"}',
        'project-thing-url': 'https://api.ft.com/thing/5d24e298-c1da-4831-8332-74941875a159',
        'projectUUID': uuid,
        'assetS3Path': path,
        'assetTitle':  title
      }
    }
  end

end
