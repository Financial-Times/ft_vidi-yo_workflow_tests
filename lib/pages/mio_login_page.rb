require_relative 'mio_login_page'
require_relative 'mio_base_page'

class MioLoginPage < MioBasePage

  page_url 'https://master.dev.nativ-systems.com/'

  text_field(:username_field, id: 'j_username')
  text_field(:password_field, id: 'j_password')
  button(:submit_button, id: 'submit_control-button')


  def log_in(user=ADMIN_USER)
    true if @browser.link(title: 'Logout').present?
    self.username_field = user[:mio_username]
    self.password_field = user[:mio_password]
    submit_button
  end

end