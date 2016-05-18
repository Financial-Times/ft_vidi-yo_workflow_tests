require 'test/unit'
require_relative 'ws_user'

class WSUserTest < Test::Unit::TestCase

  def setup
    @test_user = WSUser.new
  end

  def test_user_has_default_username
    raise StandardError if @test_user.username.empty?
  end

  def test_user_has_default_password
    raise StandardError if @test_user.password.empty?
  end

  def test_username_and_password_can_be_set
    @custom_test_user = WSUser.new('Doris', 'DorisSecret')
    raise StandardError unless @custom_test_user.username == 'Doris'
    raise StandardError unless @custom_test_user.password == 'DorisSecret'
  end

end
