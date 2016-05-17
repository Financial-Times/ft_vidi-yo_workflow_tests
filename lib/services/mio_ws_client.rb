class MioWSClient

  def initialize(user, url)
    @username = user.username
    @password = user.password
    @headers = {'Accept' => 'application/json', 'Content-Type' => 'application/vnd.nativ.mio.v1+json'}
    @url = url
  end

  private
  def get_metadata
    begin

      response = RestClient::Request.execute(method: :get, url: @url, user: @username, password: @password, headers: @headers)

      JSON.parse(response)

    rescue Exception => e
      $stdout.puts <<ERROR
                    Cannot connect to service
                    #{e.message}
                    Using cached field names
ERROR
      return nil
    end

  end

end
