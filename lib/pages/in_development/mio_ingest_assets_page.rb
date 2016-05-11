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
  radio_button  :no_restrictions, id: 'TBC'
  radio_button  :has_restrictions, id: 'TBC'
  text_field    :restriction_description, id: 'TD'
  button        :ingest_button, id: 'TBC'


  def ingest_asset(asset)

  end

end