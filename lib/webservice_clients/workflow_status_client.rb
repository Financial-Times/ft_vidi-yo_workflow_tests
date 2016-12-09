require_relative '../../lib/ft_video_webservice_client/ft_video_webservice_client'



class WorkflowStatusClient < VideoWebserviceClient

  def initialize(user=WSUser.new, url="#{MIO_WS_URL}/workflows")
    @url = url
    @user = user
    @headers = {Accept: 'application/json', :'Content-Type' => 'application/vnd.nativ.mio.v1+json'}
  end

  def retrieve_workflow_summary
    info_logger :info, <<RSP
    **********************************************
    META URL: #{@url}
    META HEADERS: #{@headers}
RSP

    RestClient::Request.execute(method: :get, url: @url, timeout: 30, user: @user.username, password: @user.password, headers: @headers) do |response|
      info_logger :info, <<LOGINFO
      Initiating RestClient
      URL: #{@url}
      URL CLASS: #{@url.class}
LOGINFO
      @response = response
      info_logger :info, 'WS request successful: metadata description retrieved'
      JSON.parse(response)
    end
  end


end