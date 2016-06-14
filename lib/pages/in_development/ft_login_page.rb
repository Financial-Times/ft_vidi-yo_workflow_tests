# frozen_string_literal: true
##
# PageObject for ingteracting with Login form
#
class FTLoginPage < PanelPage

  include Logging

  page_url "#{Constants::FT_ROOT_URL}/<%=params[:panel]%>"

  link(:log_in_button, href: /login/)
  link(:log_out_button, href: /logout/)
  text_field(:username, id: /Username/)
  text_field(:password, id: /Password/)
  div(:login_container, id: 'handler__login')
  button(:login_button) { login_container_element.button_element }

  ##
  # Logs a user in through the web interface
  #
  # @param [Hash] user admin user
  # @return [TrueClass]
  def log_in(user=Constants::ADMIN_USER)
    log_out_button_element.when_present.click
    log_in_button_element.when_present.click
    log_in_button_element.when_present.click
    self.username = user[:username]
    self.password = user[:password]
    login_button
    error_logger :warn, 'Login Failed' unless logged_in?
  end

end
