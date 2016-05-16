require 'test/unit'
require_relative '../../test/data/ws_user'
require_relative '../../lib/services/create_project_panel_service'

class CreateProjectPanelServiceTest < Test::Unit::TestCase


  def setup
    @mio_client = CreateProjectPanelService.new(WSUser.new)
    @create_project_panel_elements = @mio_client.get_create_project_panel_elements
  end


  def test_get_create_project_panel_elements
    fail "Element #{@create_project_panel_elements.class} is not a Hash" unless
        @create_project_panel_elements.class.equal? Hash


    fail "Element @create_project_panel_elements #{@create_project_panel_elements}" unless
         @create_project_panel_elements.has_key?('project') || @create_project_panel_elements.has_key?('text')
  end


end