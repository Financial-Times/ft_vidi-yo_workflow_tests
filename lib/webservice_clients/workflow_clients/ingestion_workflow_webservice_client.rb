# frozen_string_literal: true
require_relative '../../ft_video_webservice_client/ft_video_webservice_client'
require_relative '../../../test/data/ws_user'
require_relative '../../../test/data/custom_request_data'
require_relative 'workflow_webservice_client'
require_relative '../../../config/config'

##
# Handles Ingestion workflow operations
class IngestionWorkflowWebserviceClient < WorkflowWebserviceClient

  include Config::Constants

  def initialize(user=WSUser.new, url="#{MIO_WS_URL}/workflows")
    super
    @object_type = :ingest_workflow
    @url = url
  end

  # Wrapper to create project with self.create_project_workflow_payload
  #
  # @return [Hash] created project object converted from JSON service response
  def create_ingestion_workflow(params={})
    payload=create_ingestion_workflow_payload(params)
    create_workflow(payload)
  end

  # Builds the payload to create an ingestion workflow
  #
  # @param params Hash
  # @return [Hash] payload for RestClient to convert to JSON and create workflow
  # noinspection RubyInstanceMethodNamingConvention
  def create_ingestion_workflow_payload(params={})
    params[:uuid] ||= Config::Constants::ASSET_UUID
    params[:path] ||= Config::Constants::ASSET_PATH
    params[:title] ||= Config::Constants::ASSET_TITLE
    params[:url] ||= Config::Constants::ASSET_URL + params[:uuid] + '/'


    {
      'definitionId':    Config::Constants::INGESTION_WORKFLOW_METADATA_ID,
      'stringVariables': {
        'assetMetadata':     '{ "clip-type":"http://api.ft.com/things/a0e8ca2e-03b4-4321-9b50-4a85b38298cd",'\
'"clip-description": "10 Seconds", "location":"http://sws.geonames.org/6619890/",'\
'"interviewee": "Jem Rayfield","office": "http://api.ft.com/things/a29a5f4f-b4ff-46f7-b597-a30437783e1e",'\
'"producer": "http://api.ft.com/things/a4fda01e-dd90-490b-a7be-7c74eafd3884","freelance-producer": "James Condron",'\
'"reporter-1": "Darren Bown", "reporter-2":"Dario Villanueva","reporter-3":"Jon Best", "restrictions": '\
'"true", "restriction-description":"Sensitive Video....classified top secret"}',
        'project-thing-url': params[:url],
        'projectUUID':       params[:uuid],
        'assetS3Path':       params[:path],
        'assetTitle':        params[:title]
      }
    }
  end

end
