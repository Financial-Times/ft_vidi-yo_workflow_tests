require 'rest-client'

class MioWSClient

  def initialize(user)
    @username = user.username
    @password = user.password
    @headers = {'Accept' => 'application/json', 'Content-Type' => 'application/vnd.nativ.mio.v1+json'}
  end

  def get_create_project_panel
    response = RestClient::Request.execute(method: :get,
                                url: 'https://master.dev.nativ-systems.com/api/metadataDefinitions/11312/definition',
                                user: @username,
                                password: @password,
                                headers: @headers
                               )
    JSON.parse(response)
  end

end