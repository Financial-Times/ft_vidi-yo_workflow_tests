require 'test/unit'
require_relative '../../test/data/ws_user'
require_relative '../../lib/services/create_project_panel_service'

class CreateProjectPanelServiceTest < Test::Unit::TestCase


  def setup
    @mio_client = CreateProjectPanelService.new(WSUser.new)
    @create_project_panel_attributes = @mio_client.get_create_project_panel_attributes
  end


  def test_can_get_project_panel_attributes
    fail "Project panel data fetch failed (#{@create_project_panel_attributes.class})" unless
        @create_project_panel_attributes.class.equal?(Array)
  end

  def test_project_panel_attributes
    #This might fail if the data definition changes
    expected = 'project'
    fail "Project panel data does not include '#{expected}' (#{@create_project_panel_attributes.inspect})" unless
        @create_project_panel_attributes.include?(expected)
  end

end