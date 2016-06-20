# frozen_string_literal: true
require 'vcr'
require 'rest-client'
require_relative '../../config/config'
require_relative '../../test/data/custom_request_data'

##
# Generic client for Video Web Service
class VideoWebserviceClient

  include Config::Constants
  include Config::Logging

  # Init
  #
  # @param user [WSUser] the user used to log in
  # @param url [String] the url that the client will use to access the resource
  # @return [VideoWebserviceClient]
  def initialize(user, url)
    @username = user.username
    @password = user.password
    @headers = {Accept: 'application/json', 'Content-Type': 'application/vnd.nativ.mio.v1+json'}
    @url = url
  end

  # Retrieves a Mio metadata definition.
  #
  # @return [Hash] of requested object
  def retrieve_resource
    definition_id = @url.gsub(/[^0-9]/, '')
      RestClient::Request.execute(method: :get, url: @url, timeout: 10, user: @username, password: @password,
                                  headers: @headers) do |response|
        raise "Retrieve resource #{definition_id} request failed" unless HTTP_SUCCESS_CODES.cover? response.code
        info_logger :info, "WS request successful - resource_request-#{definition_id}"
        JSON.parse(response)
      end
  end

  # Creates a new Mio resource
  #
  # @param payload [Hash] :payload for POST request, to be converted to JSON by RestClient
  # @return [Hash] of requested object
  def create_resource(payload)
      info_logger :info, "Request Url: #{@url}"
      info_logger :info, "Headers: #{@headers}"
      info_logger :info, "Username: #{@username}"
      info_logger :info, "Password: #{@password}"
      info_logger :info, "Payload: #{payload}"
      RestClient::Request.execute(method: :post, url: @url, timeout: 10, user: @username, password: @password,
                                content_type: 'text/plain', headers: @headers, payload: payload.to_json) do |response|
        raise "Create #{@object_type} request failed, HTTP STATUS: #{response}" unless HTTP_SUCCESS_CODES.cover? response.code
        info_logger :info, "#{@object_type} created"
        info_logger :info, JSON.parse(response)
        JSON.parse(response)
      end
  end

  # Creates a new Mio resource, bypassing VCR
  # Temporary fix until I can find a way to bypass VCR dynamically.
  #
  # @param payload [Hash] :payload for POST request, to be converted to JSON by RestClient
  # @return [Hash] of requested object
  def live_create_resource(payload)
    info_logger :info, "Request Url: #{@url}"
    info_logger :info, "Headers: #{@headers}"
    info_logger :info, "Payload: #{payload.to_json}"
    RestClient::Request.execute(method: :post, url: @url, timeout: 10, user: @username, password: @password,
                                content_type: 'text/plain', headers: @headers, payload: payload.to_json) do |response|
      raise "Create #{@object_type} request failed" unless HTTP_SUCCESS_CODES.cover? response.code
      info_logger :info, "#{@object_type} created"
      info_logger :info, JSON.parse(response)
      JSON.parse(response)
    end
  end

  # Retrieves a Mio metadata definition bypassing VCR
  # Temporary fix until I can find a way to bypass VCR dynamically.
  #
  # @return [Hash] of requested object
  def live_retrieve_resource
    definition_id = @url.gsub(/[^0-9]/, '')
      RestClient::Request.execute(method: :get, url: @url, timeout: 10, user: @username, password: @password,
                                  headers: @headers) do |response|
        raise "Retrieve resource #{definition_id} request failed" unless HTTP_SUCCESS_CODES.cover? response.code
        info_logger :info, "WS request successful - resource_request-#{definition_id}"
        JSON.parse(response)
      end
  end

end
