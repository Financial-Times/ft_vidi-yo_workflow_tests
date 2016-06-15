# frozen_string_literal: true
require 'yaml'

module Config

  module Logging

    ERROR_LOG = $stderr
    INFO_LOG  = $stdout

    def info_logger(level, message)
      Logger.new(INFO_LOG).method(level).call(message)
    end

    def error_logger(level, message)
      Logger.new(ERROR_LOG).method(level).call(message)
      # Logger.new($stderr).method(level).call(message)
    end

  end

  module Constants

    execution_environment ||= :dev
    REPORTS ||= '../../reports'
    CONFIG ||= YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), 'master.yml')))
    ENVIRONMENT_CONFIG ||= CONFIG[execution_environment]
    MIO_ROOT_URL ||= ENVIRONMENT_CONFIG[:url]
    FT_ROOT_URL ||= ENVIRONMENT_CONFIG[:ft_url]
    ADMIN_USER ||= ENVIRONMENT_CONFIG[:admin_user]
    DEFAULT_SECTION = 'http://api.ft.com/things/12bcffe1-f9f1-47ce-a3aa-e2dcdfaf7499'
    DEFAULT_BRAND = 'http://api.ft.com/things/d4991c65-5e03-471c-bbba-fdb20d9d1009'
    HTTP_SUCCESS_CODES = (200...299)
    WAIT_DELAY = 5

  end

end
