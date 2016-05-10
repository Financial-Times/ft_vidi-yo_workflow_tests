require_relative '../mio_page'

class MioCreateVideoProjectPage < MioPage

  text_field(:project_name_field, id: 'TBC')
  select_list(:section_selector, id: 'TBC')
  text_fields(:brand_selectors, id: 'TBC')

end