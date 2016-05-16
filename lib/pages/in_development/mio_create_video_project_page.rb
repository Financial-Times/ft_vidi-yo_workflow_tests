require_relative '../mio_page'
require_relative '../mio_metadata_entry_form'
require_relative '../../../lib/services/create_project_panel_service'

class MioCreateVideoProjectPage < MioMetadataEntryForm

  CreateProjectPanelService.new.get_text_field_elements.each do |k,v|
    text_field(k, id: 'TBC')
  end

  CreateProjectPanelService.new.get_selector_elements.each do |k,v|
    select_list(k, id: 'TBC')
  end

end