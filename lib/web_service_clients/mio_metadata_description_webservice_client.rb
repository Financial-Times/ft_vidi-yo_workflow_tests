require_relative 'mio_webservice_client'
require_relative '../../test/data/ws_user'

class MioMetadataDescriptionWebserviceClient

  def initialize(user=WSUser.new, url="#{MioConstants::ROOT_URL}/api/metadataDefinitions")
    @url = url
    @user = user
  end

  def retrieve_description_metadata
    VCR.use_cassette('metadata_description') do
      RestClient::Request.execute(method: :get, url: @url, timeout: 10, user: @user.username, password: @user.password, headers: @headers) do |response|
        @response = response
        JSON.parse(response)
      end
    end
  end

  def retrieve_descriptions
    backup_json = File.expand_path('test/json/backup_description_metadata_cache.json')
    response = retrieve_description_metadata
    return (response.has_key? 'metadataDefinitions') ?
      response :
        JSON.parse(File.read(backup_json))
  end

  def retrieve_description_by_name(name)
    response = retrieve_description_metadata['metadataDefinitions']
    response.each do |description|
      return description if description['name'] == name
    end
  end

  def retrieve_id_with_name(name)
    retrieve_description_by_name(name)['id']
  end

end
