require 'test/unit'
require_relative '../../test/data/ws_user'
require_relative '../../lib/services/mio_ws_client'

class MioClientTest < Test::Unit::TestCase


  def setup
    @mio_client = MioWSClient.new(WSUser.new)
    @create_project_panel = @mio_client.get_create_project_panel
  end

  def test_can_get_project_panel
    fail "Project panel data fetch failed (#{@create_project_panel.class})" unless @create_project_panel.class.equal?(Hash)
  end

end