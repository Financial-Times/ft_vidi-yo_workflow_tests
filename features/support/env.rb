require 'cucumber'
require 'watir-webdriver'
require 'rspec/expectations'
require 'page-object'
require 'test-unit'
require 'yaml'

require_relative '../../lib/pages/mio_page'
require_relative '../../lib/mio_exceptions/mio_exceptions'

World(PageObject::PageFactory)
World(FactoryGirl::Syntax::Methods)


#TODO: Refactor all this.
execution_environment ||= :dev
$browser = ENV['SESSION_BROWSER'].to_sym
REPORTS = '../../reports'
CONFIG = YAML.load_file('config/master.yml')
ENVIRONMENT_CONFIG = CONFIG[execution_environment]
ROOT_URL = ENVIRONMENT_CONFIG[:url]
ADMIN_USER = ENVIRONMENT_CONFIG[:admin_user]