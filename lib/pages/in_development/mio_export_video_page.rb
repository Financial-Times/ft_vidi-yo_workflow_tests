require_relative '../mio_metadata_entry_form'

class MioExportVideoPage < MioMetadataEntryForm

  button :export_button, id: 'TBC' #TODO: Replace with dynamic selector when service is ready
  select_list :project, id: 'TBC' #TODO: Replace with dynamic selector when service is ready
  select_list :section, id: 'TBC' #TODO: Replace with dynamic selector when service is ready
  select_list :brand, id: 'TBC' #TODO: Replace with dynamic selector when service is ready


end