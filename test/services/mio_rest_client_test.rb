require 'test/unit'
require 'rest-client'
require_relative '../test_helper'
require_relative '../../test/data/ws_user'
require_relative '../../lib/web_service_clients/mio_webservice_client'

class MioRestClientTest < MioTest

  def setup
    @create_workflow_payload = {
        definitionId: 12387,
        stringVariables: {projectMetadata: ("{\"project\": \"#{random_string(6)}\",\"<section>\": \"http://api.ft.com/things/12bcffe1-f9f1-47ce-a3aa-e2dcdfaf7499\", \"brand\": \"http://api.ft.com/things/d4991c65-5e03-471c-bbba-fdb20d9d1009\"}")}
    }

  end

  def test_create_workflow
    puts @create_workflow_payload
    response = MioWebserviceClient.new(WSUser.new, "#{MioConstants::ROOT_URL}/api/workflows/")
                   .create(@create_workflow_payload)
    puts response
    assert_respond_to(response, :each_value)
    assert(!(response.has_key? 'errors'))
    assert response.has_key? 'href'
  end

end
