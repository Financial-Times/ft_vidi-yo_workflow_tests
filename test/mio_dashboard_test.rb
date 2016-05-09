require_relative '../lib/pages/mio_dashboard'
require_relative '../lib/pages/mio_base_page'
require 'test-unit'

class MioDashboardTest < Test::Unit::TestCase

  def setup
    @browser = Watir::Browser.new(:phantomjs)
    @dashboard = MioDashboard.new(@browser)
    @tabs=%i{desktop_tab assets_tab players_tab tasks_tab jobs_tab workflows_tab resources_tab}
  end

  def test_displayed
    raise "MioDashboard can't be <:visible?>" unless @dashboard.respond_to? :displayed?
  end

  def test_change_section
    raise "MioDashboard can't <:change_section>" unless @dashboard.respond_to? :change_section
  end


  def test_has_tabs
    @tabs.each do |tab|
      raise "MioDashboard doesn't have #{tab}" unless @dashboard.respond_to? tab
    end
  end

  def teardown
    @browser.close
  end

end