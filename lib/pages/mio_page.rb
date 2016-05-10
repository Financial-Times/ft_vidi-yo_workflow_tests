require 'page-object'


class MioPage

  include PageObject
  require_relative 'mio_login_page'
  require_relative 'mio_dashboard'

  element(:site_header, id: 'TBC')

end