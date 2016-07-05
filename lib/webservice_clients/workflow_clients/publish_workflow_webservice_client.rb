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
    params[:path] ||= '2221711291001_4691472776001_4691406811001.mp4'
    params[:title] ||= 'RestClient Agent'
    params[:url] ||= 'https://api.ft.com/thing/b0778312-7686-49bc-a720-0551709ad37b'

    {"definitionId": 20897,
     "stringVariables": {
         "assetMetadata": "{ \"section\": \"http://api.ft.com/things/12bcffe1-f9f1-47ce-a3aa-e2dcdfaf7499\","\
          "\"brand\": \"http://api.ft.com/things/d4991c65-5e03-471c-bbba-fdb20d9d1009\", \"headline\": \"PHEW WHAT A SCORCHER!!\""\
          ", \"long-lead\": \"its a short lead\", \"short-lead\": \"nah its never a long lead no it is\","\
          " \"link-1\": \"http://link-1\", \"link-2\": \"http://link-2\", \"link-3\": \"http://link-3\","\
          " \"credit\": \"Credits?\","\
          " \"office\": \"http://api.ft.com/things/66fc881d-4a93-4672-8d88-1fa86e5ec5a2\","\
          " \"producer\": \"http://api.ft.com/things/ce989f93-8572-4136-a0c0-a7bb44f94c7b\","\
          " \"video-editor\": \"http://api.ft.com/things/67b8180e-9cb3-4694-8bfd-08b9871bc4d1\","\
          " \"freelance-video-editor\": \"Jem Rayfield The Video pro\", \"restrictions\": \"true\","\
          " \"restriction-description\": \"Dazzla's vid\", "\
          "\"poster-image\": { \"file-name\": \"test\", \"file-path\": \"s3://s3-eu-west-1.amazonaws.com/video-final-edit/poster.jpeg\"},"\
          " \"thumbnail-image\": { \"file-name\": \"test\", \"file-path\": \"https://s3-eu-west-1.amazonaws.com/video-final-edit/thumbnail.jpeg\"},"\
          " \"brightcove-metadata\": \"freetext metadata nonsense\" }",
           'project-thing-url': params[:url],
           'assetS3Path':       params[:path],
           'assetTitle':        params[:title],
           'brightcovePublish': false
    }
    }
  end

end