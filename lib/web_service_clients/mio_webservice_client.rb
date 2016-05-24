class MioWebserviceClient

  def initialize(user, url)
    @username = user.username
    @password = user.password
    @headers = {'Accept' => 'application/json', 'Content-Type' => 'application/vnd.nativ.mio.v1+json'}
    @url = url
  end

  def retrieve_metadata
    puts @url
    definition_id = @url.gsub(/[^0-9]/, '')
    VCR.use_cassette("definition_request-#{definition_id}") do
      RestClient::Request.execute(method: :get, url: @url, timeout: 10, user: @username, password: @password, headers: @headers) do |response|
        @response = response
        JSON.parse(response)
      end
    end
  end

end
