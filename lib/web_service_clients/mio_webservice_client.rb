class MioWebserviceClient

  def initialize(user, url)
    @username = user.username
    @password = user.password
    @headers = {'Accept' => 'application/json', 'Content-Type' => 'application/vnd.nativ.mio.v1+json'}
    @url = url
  end

  ##
  # Generic client for Mio Web Service
  def retrieve_metadata
    definition_id = @url.gsub(/[^0-9]/, '')
    VCR.use_cassette("definition_request-#{definition_id}") do
      RestClient::Request.execute(method: :get, url: @url, timeout: 10, user: @username, password: @password,
                                  headers: @headers) do |response|
        JSON.parse(response)
      end
    end
  end

  def create_workflow(payload)
   VCR.use_cassette('create_workflow') do
      RestClient::Request.execute(method: :post, url: @url, timeout: 10, user: @username, password: @password,
                                  :content_type => 'text/plain', headers: @headers, payload: payload.to_json) do |response|
        JSON.parse(response)
      end
    end
  end

end

