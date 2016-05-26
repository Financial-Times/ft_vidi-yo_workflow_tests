require 'test/unit'
require 'rest-client'
require_relative '../test_helper'
require_relative '../../test/data/ws_user'
require_relative '../../lib/web_service_clients/mio_webservice_client'

class MioRestClientTest < MioTest

  def setup
    @create_workflow_payload = {
        definitionId: 12387,
        stringVariables: {projectMetadata: ("{\"project\": \"#{random_string(6)}\", \"section\": \"<section>\", \"brand\": \"<brand>\"}").freeze}
    }

  end

  def test_create_workflow
    response = MioWebserviceClient.new(WSUser.new, "#{MioConstants::ROOT_URL}/api/workflows/")
                   .create_workflow(@create_workflow_payload)
    puts response
    assert_respond_to(response, :each_value)
    assert(!(response.has_key? 'errors'))
    assert response.has_key? 'href'
  end

end
