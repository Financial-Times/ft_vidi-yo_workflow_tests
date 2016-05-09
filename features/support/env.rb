require 'cucumber'
require 'watir-webdriver'
require 'rspec/expectations'
require 'page-object'
require 'test-unit'
require 'yaml'

require_relative '../../lib/pages/page_requires'

World(PageObject::PageFactory)


#TODO: Refactor all this.
execution_environment ||= :dev
$browser = ENV['SESSION_BROWSER'].to_sym
REPORTS = '../../reports'
CONFIG = YAML.load_file('config/master.yml')
ENVIRONMENT_CONFIG = CONFIG[execution_environment]
ROOT_URL = ENVIRONMENT_CONFIG[:url]
ADMIN_USER = ENVIRONMENT_CONFIG[:admin_user]