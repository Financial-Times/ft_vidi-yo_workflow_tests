# frozen_string_literal: true
require 'page-object'
require_relative '../mio_page'
require_relative '../../../lib/web_service_clients/create_ingest_asset_webservice_client'

##
# PageObject for Ingest Assets page
class IngestPage < MioPage

  button :ingest_button, id: 'TBC'

  define_page_elements(CreateIngestAssetWebserviceClient.new)

  # Complete form for Ingestion
  #
  # @param asset [MioVideoAsset]
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
