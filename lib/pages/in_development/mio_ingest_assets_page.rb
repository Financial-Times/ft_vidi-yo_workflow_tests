require 'page-object'
require_relative '../mio_page'
require_relative '../../../lib/web_service_clients/mio_create_ingest_asset_webservice_client'

class MioIngestAssetsPage < MioPage

  button :ingest_button,  id: 'TBC' # TODO: Replace with dynamic selector

  webservice_client = MioCreateIngestAssetWebserviceClient.new

  webservice_client.extract_text_field_elements.each do |name, attribute|
    text_field(name, id: 'TBC')
  end

  webservice_client.extract_selector_elements.each do |name, attribute|
    select_list(name, id: 'TBC')
  end

  webservice_client.extract_url_elements.each do |name, attribute|
    link(name, id: 'TBC')
  end

  webservice_client.extract_boolean_elements.each do |name, attribute|
    element(name, id: 'TBC') #TBC - depends on implementation
  end

  webservice_client.extract_image_elements.each do |name, attribute|
    img(name, id: 'TBC')
  end

  def create_ingestion(asset=FactoryGirl.build(:full_mio_video_asset))
    self.project = asset.project_name
    self.clip_type_selector = asset.clip_type
    self.clip_description = asset.description
    self.location_selector = asset.location_selector
    self.interviewee_selector = asset.interviewee
    self.ft_office_selector = asset.ft_office
    self.producer_selector = asset.producer
    self.freelance_producer_selector = asset.freelance_producer
    self.reporter_writer_1 = asset.reporter_writer_1
    self.reporter_writer_2 = asset.reporter_writer_2
    self.reporter_writer_3 = asset.reporter_writer_3
    select_has_restrictions
    ingest_button
  end

end
