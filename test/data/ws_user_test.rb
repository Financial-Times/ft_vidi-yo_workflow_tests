require 'test/unit'
require_relative 'ws_user'

class WSUserTest < Test::Unit::TestCase

  def setup
    @test_user = WSUser.new
  end

  def test_user_has_default_username
    raise StandardError unless @test_user.username.length > 0
  end

  def test_user_has_default_password
    raise StandardError unless @test_user.password.length > 0
  end

  def test_username_and_password_can_be_set
    @custom_test_user = WSUser.new('Doris', 'DorisSecret')
    raise StandardError unless @custom_test_user.username == 'Doris'
    raise StandardError unless @custom_test_user.password == 'DorisSecret'
  end

  def teardown
    # Do nothing
  end
end