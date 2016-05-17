class MioMetadataEntryForm < MioPage

  # TODO: Add real selector definitions
  select_list   :section, is: 'TBC'
  text_field    :credit, id: 'TBC'
  text_field    :project, id: 'TBC'
  select_list   :brand, id: 'TBC'
  text_field    :headline_field, id: 'TBC'
  text_field    :long_lead_field, id: 'TBC'
  text_field    :short_lead_field, id: 'TBC'
  text_fields   :related_content_fields, id: 'TBC'
  element       :page_heading, id: 'TBC'
  select_list   :clip_type_selector, id: 'TBC'
  text_field    :clip_description, id: 'TBC'
  select_list   :location_selector, id: 'TBC'
  select_list   :interviewee_selector, id: 'TBC'
  select_list   :ft_office_selector, id: 'TBC'
  select_list   :producer_selector, id: 'TBC'
  select_list   :freelance_producer_selector, id: 'TBC'
  text_field    :reporter_writer_1, id: 'TBC'
  text_field    :reporter_writer_2, id: 'TBC'
  text_field    :reporter_writer_3, id: 'TBC'
  radio_button  :no_restrictions, id: 'TBC'
  radio_button  :has_restrictions, id: 'TBC'
  text_field    :restriction_description, id: 'TD'
  select_list   :video_editor_selector, id: 'TBC'
  element       :add_thumbnails_drop_zone, id: 'TBC'
  images        :thumbnail_previews, id: 'ID'



end