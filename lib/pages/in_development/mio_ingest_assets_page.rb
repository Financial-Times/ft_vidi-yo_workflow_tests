require 'page-object'
require_relative '../mio_page'

class MioIngestAssetsPage < MioPage

  element       :page_heading, id: 'TBC'
  text_field    :project_name, id: 'TBC'
  select_list   :clip_type_selector, id: 'TBC'
  text_field    :clip_description, id: 'TBC'
  select_list   :location_selector, id: 'TBC'
  select_list   :interviewee_selector, id: 'TBC'
  select_list   :ft_office_selector, id: 'TBC'
  select_list   :producer_selector, id: 'TBC'
  select_list   :freelance_producer_selector, id: 'TBC'
  element       :reporter_writer_1, id: 'TBC'
  element       :reporter_writer_2, id: 'TBC'
  element       :reporter_writer_3, id: 'TBC'
  radio_button  :restrictions_yes_selector, id: 'TBC'
  radio_button  :restrictions_no_selector, id: 'TBC'
  text_field    :restrictions_description, id: 'TBC'
  button        :ingest_button, id: 'TBC'


  def ingest_asset(asset)

  end

end