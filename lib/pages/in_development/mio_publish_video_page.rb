require_relative '../mio_metadata_entry_form'

class MioPublishVideoPage < MioMetadataEntryForm

  button      :export_button, id: 'TBC' # TODO: Replace with dynamic selector
  select_list :project, id: 'TBC' # TODO: Replace with dynamic selector
  select_list :section, id: 'TBC' # TODO: Replace with dynamic selector
  select_list :brand, id: 'TBC' # TODO: Replace with dynamic selector

end
