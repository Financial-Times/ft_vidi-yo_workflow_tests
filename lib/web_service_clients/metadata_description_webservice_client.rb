# frozen_string_literal: true
require_relative 'mio_webservice_client'
require_relative '../../test/data/ws_user'
require_relative '../../config/config'

##
# Parses metadata description to allow retrieval of individual definitions
class MetadataDescriptionWebserviceClient

  include Config::Logging
  include Config::Constants

  def initialize(user=WSUser.new, url="#{MIO_ROOT_URL}/api/metadataDefinitions")
    @url = url
    @user = user
    @headers = {Accept: 'application/json', 'Content-Type': 'application/vnd.nativ.mio.v1+json'}
  end

  # REST call to get definition descriptions from Web Service. Return value can then be used
  # to fetch individual definitions
  def retrieve_description_metadata
    VCR.use_cassette('metadata_description') do
      RestClient::Request.execute(method: :get, url: @url, timeout: 10, user: @user.username, password: @user.password, headers: @headers) do |response|
        @response = response
        info_logger :info, 'WS request successful: metadata description retrieved'
        JSON.parse(response)
      end
    end
  end

  # Takes name, returns definition description
  #
  # @param name [String] name of parameter
  # @
  def retrieve_description_by_name(name)
    response = retrieve_description_metadata['metadataDefinitions']
    response.each do |description|
      return description if description['name'] == name
    end
  end

  # Takes description name, returns ID.
  def retrieve_id_with_name(name)
    retrieve_description_by_name(name)['id']
  end

end
