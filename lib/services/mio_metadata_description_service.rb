require_relative 'mio_ws_client'
require_relative '../../test/data/ws_user'

class MioMetadataDescriptionService < MioWSClient

  def initialize(user=WSUser.new, url=nil)
    url = url.nil? ? 'https://master.dev.nativ-systems.com/api/metadataDefinitions' : url
    super(user, url)
  end

  def retrieve_descriptions
    backup_json = File.expand_path('test/json/backup_description_metadata_cache.json')
    response = retrieve_metadata
    return (response.has_key? 'metadataDefinitions') ?
      response :
        JSON.parse(File.read(backup_json))
  end

  def retrieve_description_by_name(name)
    response = retrieve_metadata['metadataDefinitions']
    response.each do |description|
      return description if description['name'] == name
    end
  end

  def retrieve_id_with_name(name)
    retrieve_description_by_name(name)['id']
  end

end
