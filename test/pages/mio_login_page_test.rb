require_relative '../../lib/pages/mio_login_page'
require_relative '../../lib/pages/mio_page'
require 'test-unit'
require_relative 'mio_test'

class MioLoginPageTest < MioTest


  def setup
    @browser = Watir::Browser.new :phantomjs
    @login_page = MioLoginPage.new @browser
  end

  def test_is_a_mio_page
    raise ObjectIsNotAPageException unless @login_page.is_a?(MioPage)
  end

  def test_can_log_in
    raise ExpectedCapabilityNotFound, :log_in unless @login_page.respond_to? :log_in
  end

  def test_has_username_field
    raise PageElementSelectorNotFoundException, 'username_field' unless @login_page.respond_to? :username_field
  end

  def test_has_password_field
    raise PageElementSelectorNotFoundException, 'password_field' unless @login_page.respond_to? :password_field
  end

  def test_has_submit_button
    raise PageElementSelectorNotFoundException, 'submit button' unless @login_page.respond_to? :submit_button
  end

  def teardown
    @browser.close
  end

end