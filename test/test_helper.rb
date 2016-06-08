# frozen_string_literal: true
require 'factory_girl'
require_relative '../config/config'
require_relative '../vcr_setup'
require_relative '../test/factories/video_asset_factory'
require_relative '../test/factories/video_project_factory'
require_relative '../test/factories/publish_video_factory'
require_relative '../test/data/mio_video_asset'
require_relative 'mio_test'
require_relative '../test/data/mio_export_video'
require_relative '../config/config'

require 'restclient/components'
require 'rack/cache'
RestClient.enable Rack::CommonLogger, STDOUT
RestClient.enable Rack::Cache, verbose: false
