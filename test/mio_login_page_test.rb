require_relative '../lib/pages/mio_login_page'
require_relative '../lib/pages/mio_base_page'
require 'test-unit'

class MioLoginPageTest < Test::Unit::TestCase


  def setup
    @browser = Watir::Browser.new(:phantomjs)
    @login_page = MioLoginPage.new(@browser)
  end

  def test_can_log_in
    raise "Login page can't <:log_in>" unless @login_page.respond_to? :log_in
  end

  def test_has_username_field
    raise "Login_page_has_no_login_field" unless @login_page.respond_to? :username_field
  end

  def test_has_password_field
    raise 'Login_page_has_no_password_field' unless @login_page.respond_to? :password_field
  end

  def test_has_submit_button
    raise 'Login page has no submit button' unless @login_page.respond_to? :submit_button
  end

  def teardown
    @browser.close
  end

end