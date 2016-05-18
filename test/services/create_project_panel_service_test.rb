require 'test/unit'
require_relative '../../test/data/ws_user'
require_relative '../../lib/services/create_project_panel_service'

class CreateProjectPanelServiceTest < Test::Unit::TestCase


  def setup
    @mio_client = CreateProjectPanelService.new(WSUser.new)
    @mio_cached_client = CreateProjectPanelService.new(WSUser.new, 'http://www.google.com')
    @create_project_panel_elements = @mio_client.get_panel_elements
    @create_project_panel_elements_cached = @mio_cached_client.get_panel_elements
  end


  def test_get_create_project_panel_elements
    fail "Element #{@create_project_panel_elements.class} is not a Hash" unless
        @create_project_panel_elements.class.equal? Hash


    fail "Element @create_project_panel_elements #{@create_project_panel_elements}" unless
         @create_project_panel_elements.has_key?('project') || @create_project_panel_elements.has_key?('text')
  end

  def test_falls_back_to_cache_if_no_service
    fail "Element @create_project_panel_elements #{@create_project_panel_elements_cached}" unless
        @create_project_panel_elements_cached.has_key?('project') || @create_project_panel_elements_cached.has_key?('text')
  end


end