require 'page-object'
require_relative '../mio_page'

class MioIngestAssetsPage < MioPage

  element     :page_heading, id: 'TBC'
  element     :project_name, id: 'TBC'
  element     :clip_type_selector, id: 'TBC'
  text_field  :clip_description, id: 'TBC'
  element     :location_selector, id: 'TBC'
  text_field  :interviewee, id: 'TBC'
  element     :ft_office_selector, id: 'TBC'
  element     :producer_selector, id: 'TBC'
  element     :freelance_producer_selector, id: 'TBC'
  element     :reporter_writer_1, id: 'TBC'
  element     :reporter_writer_2, id: 'TBC'
  element     :reporter_writer_3, id: 'TBC'
  element     :restrictions_yes_selector, id: 'TBC'
  element     :restrictions_no_selector, id: 'TBC'
  text_field  :restrictions_description, id: 'TBC'
  button      :ingest_button, id: 'TBC'

  def ingest_asset(asset)

  end

end