require 'test/unit'
require_relative '../../test/video_test'
require_relative '../../lib/webservice_clients/workflow_clients/publish_workflow_webservice_client'

class PublishWorkflowWebserviceClientTest < VideoTest

  def setup
    @publish_workflow_ws_client = PublishWorkflowWebserviceClient.new
  end

  def test_can_create_default_payload
    payload = @publish_workflow_ws_client.create_publish_workflow_payload
    assert_kind_of(Hash, payload)
    info_logger :info, "Payload: #{payload}"
    assert(payload.has_key? :definitionId)
    assert(payload.has_key? :stringVariables)
    assert(payload[:stringVariables].has_key? :assetMetadata)
  end

  def test_can_create_custom_payload
    custom_payload = @publish_workflow_ws_client.create_publish_workflow_payload(
        {
            url: 'http://example.com',
            path: 'test_path',
            title: 'custom_title'
        }

    )
    string_variables = custom_payload[:stringVariables]
    info_logger :info, "Custom Payload: #{string_variables.keys}"
    assert_equal(Config::Constants::ASSET_URL, string_variables[:'project-thing-url'])
    assert_equal('test_path', string_variables[:assetS3Path])
    assert_equal('custom_title', string_variables[:assetTitle])


  end

  def test_can_create_valid_publish_workflow
    VCR.use_cassette 'unit create publish workflow' do
      @publish_workflow = @publish_workflow_ws_client.create_publish_workflow
    end
  end

end