require 'yaml'

module MioConstants

  execution_environment ||= :dev
  REPORTS ||= '../../reports'.freeze
  CONFIG ||= YAML.load_file('config/master.yml')
  ENVIRONMENT_CONFIG ||= CONFIG[execution_environment]
  ROOT_URL ||= ENVIRONMENT_CONFIG[:url]
  ADMIN_USER ||= ENVIRONMENT_CONFIG[:admin_user]
  DEFAULT_SECTION = 'http://api.ft.com/things/12bcffe1-f9f1-47ce-a3aa-e2dcdfaf7499'
  DEFAULT_BRAND = 'http://api.ft.com/things/d4991c65-5e03-471c-bbba-fdb20d9d1009'

end
