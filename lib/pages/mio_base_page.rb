require 'page-object'


class MioBasePage

  include PageObject
  require_relative 'mio_login_page'
  require_relative 'mio_dashboard'

end