require 'yaml'

module MioConstants

  execution_environment ||= :dev
  REPORTS ||= '../../reports'.freeze
  CONFIG ||= YAML.load_file('config/master.yml')
  ENVIRONMENT_CONFIG ||= CONFIG[execution_environment]
  ROOT_URL ||= ENVIRONMENT_CONFIG[:url]
  ADMIN_USER ||= ENVIRONMENT_CONFIG[:admin_user]

end
