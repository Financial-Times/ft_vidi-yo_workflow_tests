# frozen_string_literal: true
require 'cucumber'
require 'watir-webdriver'
require 'rspec/expectations'
require 'page-object'
require 'test-unit'
require 'yaml'
require 'factory_girl'

require_relative '../../lib/pages/mio_page'
require_relative '../../lib/pages/mio_login_page'
require_relative '../../lib/pages/mio_dashboard_page'
require_relative '../../config/mio_constants'

World(PageObject::PageFactory)
World(FactoryGirl::Syntax::Methods)
World(MioConstants)
