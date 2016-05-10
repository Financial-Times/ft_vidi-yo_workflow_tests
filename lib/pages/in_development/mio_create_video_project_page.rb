require_relative '../mio_page'

class MioCreateVideoProjectPage < MioPage

  text_field(:project_name_field, id: 'TBC')
  element(:section_selector, id: 'TBC')
  elements(:brand_selectors, id: 'TBC')

end