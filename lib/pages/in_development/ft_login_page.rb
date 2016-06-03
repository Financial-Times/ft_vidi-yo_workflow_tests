class FTLoginPage < MioPage

  page_url MioConstants::FT_ROOT_URL + '/browser'

  link(:log_in_button, href: /login/)
  link(:log_out_button, href: /logout/)
  text_field(:username, id: /Username/)
  text_field(:password, id: /Password/)
  div(:login_container, id: 'handler__login')
  button(:login_button){login_container_element.button}

  def log_in(user=MioConstants::ADMIN_USER)
    log_out_button
    log_in_button
    self.username = user[:username]
    self.password = user[:password]
    login_button
    Logger.new($stdout).warn('Assert not yet possible')
  end

end