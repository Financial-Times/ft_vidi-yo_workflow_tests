require 'page-object'
require_relative '../mio_page'
require_relative '../../../lib/pages/mio_metadata_entry_form'

class MioIngestAssetsPage < MioMetadataEntryForm

  button :ingest_button,  id: 'TBC' #TODO: Replace with dynamic selector when service is ready
  text_field :project,    id: 'TBC' #TODO: Replace with dynamic selector when service is ready


  def create_ingestion(asset=FactoryGirl.build(:full_mio_video_asset))
    self.project = asset.project_name
    self.clip_type_selector = asset.clip_type
    self.clip_description = asset.description
    self.location_selector = asset.location_selector
    self.interviewee_selector = asset.interviewee
    self.ft_office_selector = asset.ft_office
    self.producer_selector = asset.producer
    self.freelance_producer_selector = self.freelance_producer
    self.reporter_writer_1 = asset.reporter_writer_1
    self.reporter_writer_2 = asset.reporter_writer_2
    self.reporter_writer_3 = asset.reporter_writer_3
    self.select_has_restrictions
    self.ingest_button
  end

end