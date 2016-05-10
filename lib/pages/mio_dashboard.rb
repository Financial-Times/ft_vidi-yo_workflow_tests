require_relative 'mio_page'

class MioDashboard < MioPage

  #TODO: DRY. Shift to dynamic method definitions
  link  :desktop_tab, id: 'desktop_section_tab'
  link  :assets_tab, id: 'assets_section_tab'
  link  :players_tab, id: 'players_section_tab'
  link  :tasks_tab, id: 'tasks_section_tab'
  link  :jobs_tab, id: 'jobs_section_tab'
  link  :workflows_tab, id: 'workflows_section_tab'
  link  :resources_tab, id: 'resources_section_tab'

  div   :dashboard_container, id: 'container'
  div   :current_feature_container, id: 'left_col'

  def displayed?
    self.wait_until{dashboard_container?}
  end

  def change_section(section)
    previous_feature = current_feature_container_element.when_present.text
    select_tab section
    current_feature = current_feature_container_element.text
    true unless current_feature == previous_feature
  end

  def select_tab(section)
    self.send("#{section}_tab_element").when_present.click
  end

end