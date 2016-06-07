# frozen_string_literal: true
require_relative '../mio_page'
require_relative '../../../lib/web_service_clients/create_project_panel_webservice_client'

##
# PageObject for Create Video page
class CreateProjectPage < MioPage

  define_page_elements(CreateProjectPanelWebserviceClient.new)

  button(:submit_project, text: 'submit')

  ##
  # Creates a bare-bones project in the web interface
  #
  # @param [String] project_name
  # @return [TrueClass]
  def create_project(project_name)
    wait_until { project? }
    project_element.when_present.value = project_name
    Logger.new($stdout).warn('Assert not yet possible on Create Project page')
    submit_project_element.when_present.click
  end

end
