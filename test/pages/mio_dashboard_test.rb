require_relative '../../lib/pages/mio_dashboard'
require 'test-unit'
require_relative 'mio_test'

class MioDashboardTest < MioTest

  def setup
    @browser = Watir::Browser.new :phantomjs
    @dashboard = MioDashboard.new @browser
    @tabs = %i(desktop_tab assets_tab players_tab tasks_tab jobs_tab workflows_tab resources_tab)
  end

  def test_displayed
    raise ExpectedCapabilityNotFound, :displayed? unless @dashboard.respond_to? :displayed?
  end

  def test_change_section
    raise ExpectedCapabilityNotFound, :change_section unless @dashboard.respond_to? :change_section
  end

  def test_has_tabs
    @tabs.each do |tab|
      raise PageElementSelectorNotFoundException, "Tab: #{tab}" unless @dashboard.respond_to? tab
    end
  end

  def teardown
    @browser.close
  end

end
