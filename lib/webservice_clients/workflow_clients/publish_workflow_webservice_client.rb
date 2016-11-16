require_relative 'workflow_webservice_client'
require_relative '../../../test/data/ws_user'

class PublishWorkflowWebserviceClient < WorkflowWebserviceClient


  def initialize(user=WSUser.new, url="#{MIO_WS_URL}/workflows")
    super
    @object_type = :publish_workflow
    @url = url
  end

  def create_publish_workflow(params={})
    payload=create_publish_workflow_payload(params)
    create_workflow(payload)
  end

  def create_publish_workflow_payload(params={})
    params[:path] ||= '12345/short.MOV'
    params[:title] ||= 'RestClient Agent'
    params[:url] ||= 'https://api.ft.com/thing/b0778312-7686-49bc-a720-0551709ad37b'

    {'definitionId': Config::Constants::PUBLISH_WORKFLOW_METADATA_ID,
     'stringVariables': {
         'assetMetadata': '{"section":"http://api.ft.com/things/12bcffe1-f9f1-47ce-a3aa-e2dcdfaf7499","brand":"http://api.ft.com/things/d4991c65-5e03-471c-bbba-fdb20d9d1009","headline":"Hello Hello its a headline","long-lead":"QA its never a long lead no it is","short-lead":"its a short QA","link-1":"http://link-1","link-1-text":"link1 text","link-2":"http://link-2","link-2-text":"link2 text","link-3":"http://link-3","link-3-text":"link3 text","credit":"Credit goes to Jem of course","office":"http://api.ft.com/things/66fc881d-4a93-4672-8d88-1fa86e5ec5a2","producer":"http://api.ft.com/things/ce989f93-8572-4136-a0c0-a7bb44f94c7b","video-editor":"http://api.ft.com/things/67b8180e-9cb3-4694-8bfd-08b9871bc4d1","freelance-video-editor":"Jem Rayfield The Video pro","restrictions":"true","restriction-description":"well suspect innit","poster-image": { "file-name":"test","file-path":"https://s3-eu-west-1.amazonaws.com/mio-edit-jemdev/12345/10SecPoster.jpeg"},"thumbnail-image": { "file-name":"test","file-path":"https://s3-eu-west-1.amazonaws.com/mio-edit-jemdev/12345/10Secthumbnail.jpeg"},"brightcove-metadata-tags": [ { "brightcove-tag":"test" }, { "brightcove-tag":"test2" } ] }',
         'assetS3Path':       params[:path],
         'assetTitle':        params[:title],
         'brightcovePublish': false,
         'project-thing-url': Config::Constants::ASSET_URL
    }
    }
  end

end