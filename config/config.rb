# frozen_string_literal: true
require 'yaml'
require 'rotp'

module Config

  module Logging

    ERROR_LOG = $stderr
    INFO_LOG = $stdout
    #File.new((File.expand_path(File.join(File.dirname(__FILE__), 'logs.txt'))), 'w+')


    def info_logger(level, message)
      Logger.new(INFO_LOG).method(level).call(message)
    end

    def error_logger(level, message)
      Logger.new(ERROR_LOG).method(level).call(message)
    end

  end

  module Constants

    EXECUTION_ENVIRONMENT = :jemdev
    REPORTS ||= '../../reports'
    CONFIG ||= YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), 'master.yml')))
    ENVIRONMENT_CONFIG ||= CONFIG[EXECUTION_ENVIRONMENT]
    MIO_ROOT_URL ||= ENVIRONMENT_CONFIG[:url]
    MIO_WS_URL ||= ENVIRONMENT_CONFIG[:ws_url]
    FT_ROOT_URL ||= ENVIRONMENT_CONFIG[:url]
    ADMIN_USER ||= ENVIRONMENT_CONFIG[:admin_user]
    DEFAULT_SECTION ||= 'http://api.ft.com/things/12bcffe1-f9f1-47ce-a3aa-e2dcdfaf7499'
    DEFAULT_BRAND ||= 'http://api.ft.com/things/d4991c65-5e03-471c-bbba-fdb20d9d1009'
    PROJECT_METADATA_NAME ||= ENVIRONMENT_CONFIG[:project_metadata_name]
    PUBLISH_METADATA_NAME ||= ENVIRONMENT_CONFIG[:publish_metadata_name]
    INGEST_METADATA_NAME ||= ENVIRONMENT_CONFIG[:ingest_metadata_name]
    HTTP_SUCCESS_CODES ||= (200...299)
    THING_URL ||= 'http://api.ft.com/things/JAMESISADICKb0778312-7686-49bc-a720-0551709ad37b'
    ASSET_TITLE ||= '10 seconds'
    ASSET_UUID ||= 'b0778312-7686-49bc-a720-0551709ad37b'
    ASSET_PATH ||= '12345/10SecondCountdown.mp4'
    WAIT_DELAY ||= 5
    ASSET_URL ||= 'http://api.ft.com/things/0909033'
    OTP ||= ROTP::TOTP.new(ENV['MIO_APP_KEY'])
    PROJECT_WORKFLOW_METADATA_ID = ENVIRONMENT_CONFIG[:project_workflow_metadata_id]
    INGESTION_WORKFLOW_METADATA_ID = ENVIRONMENT_CONFIG[:ingestion_workflow_metadata_id]
    PUBLISH_WORKFLOW_METADATA_ID = ENVIRONMENT_CONFIG[:publish_workflow_metadata_id]
  end

end
