class MioWSClient

  def initialize(user, url)
    @username = user.username
    @password = user.password
    @headers = {'Accept' => 'application/json', 'Content-Type' => 'application/vnd.nativ.mio.v1+json'}
    @url = url
  end

  def retrieve_metadata
    RestClient::Request.execute(method: :get, url: @url, timeout: 10, user: @username, password: @password, headers: @headers) do |response|
      JSON.parse(response)
    end

  rescue RestClient::Exception, JSON::JSONError, SocketError => e
    $stderr.puts <<ERROR
                    Cannot connect to service
                    #{e.class}
                    Using cached field names
ERROR
    return nil
  end

end
