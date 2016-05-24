class MioWebserviceClient

  def initialize(user, url)
    @username = user.username
    @password = user.password
    @headers = {'Accept' => 'application/json', 'Content-Type' => 'application/vnd.nativ.mio.v1+json'}
    @url = url
  end

  def retrieve_metadata
    puts @url
    begin
      definition_id = @url.gsub(/[^0-9]/, '')
      VCR.use_cassette("definition_request-#{definition_id}") do
        RestClient::Request.execute(method: :get, url: @url, timeout: 10, user: @username, password: @password, headers: @headers) do |response|
          @response = response
          JSON.parse(response)
      end

    end


  rescue RestClient::Exception, JSON::JSONError, SocketError => e
    $stderr.puts <<ERROR
                    Cannot connect to service
                    #{e.class}
#{p @response}
                    Using cached field names
ERROR
    return nil
    end
  end


end
