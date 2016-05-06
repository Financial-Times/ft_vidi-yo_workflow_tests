require 'cucumber'
require 'watir-webdriver'
require 'rspec/expectations'
require 'page-object'
require 'test-unit'
require 'yaml'

require_relative '../../lib/pages/mio_base_page'
require_relative '../../lib/pages/mio_login_page'

World(PageObject::PageFactory)


#TODO: Refactor all this.
execution_environment ||= :dev

REPORTS = '../../reports'
CONFIG = YAML.load_file('config/master.yml')
ENVIRONMENT_CONFIG = CONFIG[execution_environment]
ROOT_URL = ENVIRONMENT_CONFIG[:url]
ADMIN_USER = ENVIRONMENT_CONFIG[:admin_user]