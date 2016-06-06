# frozen_string_literal: true
require_relative '../mio_page'
require_relative '../../../lib/web_service_clients/create_project_panel_webservice_client'

##
# PageObject for Create Video page
class CreateProjectPage < MioPage

  define_page_elements(CreateProjectPanelWebserviceClient.new)

  button(:submit_project, text: 'submit')

  def create_project(project_name)
    self.wait_until{project?}
    project_element.when_present.value =  project_name
    submit_project
    Logger.new($stdout).warn('Assert not yet possible on Create Project page')
  end

end
