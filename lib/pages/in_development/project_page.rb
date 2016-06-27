# frozen_string_literal: true
require_relative '../panel_page'
require_relative '../../../lib/webservice_clients/create_project_panel_webservice_client'

##
# PageObject for Create Video page
class ProjectPage < PanelPage

  include Logging

  define_page_elements(CreateProjectPanelWebserviceClient.new)

  button(:submit_project, text: 'submit workflow')

  ##
  # Creates a bare-bones project in the web interface
  #
  # @param [String] project_name
  # @return [TrueClass]
  def create_project(project_name)
    wait_until(5) { page_displayed? }
    project_element.when_present.value = project_name
    thing_url_element.when_present.value = 'http://www.example.com'
    error_logger :warn, 'Assert not yet possible on Create Project page'
    submit_project_element.when_present.click
  end

  ##
  # Checks whether the panel is displayed
  #
  # @return [Boolean]
  def page_displayed?
    project?
  end

end
