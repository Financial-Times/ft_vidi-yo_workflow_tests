# frozen_string_literal: true
require 'vcr'
require 'rest-client'
require_relative '../../config/mio_constants'
require_relative '../../test/data/custom_request_data'

##
# Generic client for Mio Web Service
class MioWebserviceClient

  include MioConstants

  # Init
  #
  # @param user [WSUser] the user used to log in
  # @param url [String] the url that the client will use to access the resource
  # @return [MioWebserviceClient]
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
    VCR.use_cassette("resource_request-#{definition_id}") do
      RestClient::Request.execute(method: :get, url: @url, timeout: 10, user: @username, password: @password,
                                  headers: @headers) do |response|
        raise "Retrieve resource #{definition_id} request failed" unless HTTP_SUCCESS_CODES.cover? response.code
        Logger.new($stdout).info "WS request successful - resource_request-#{definition_id}"
        JSON.parse(response)
      end
    end
  end

  # Creates a new Mio resource
  #
  # @param payload [Hash] :payload for POST request, to be converted to JSON by RestClient
  # @return [Hash] of requested object
  def create_resource(payload)
    VCR.use_cassette("create_#{@object_type}") do
      RestClient::Request.execute(method: :post, url: @url, timeout: 10, user: @username, password: @password,
                                content_type: 'text/plain', headers: @headers, payload: payload.to_json) do |response|
        raise "Create #{@object_type} request failed" unless HTTP_SUCCESS_CODES.cover? response.code
        Logger.new($stdout).info "#{@object_type} created"
        JSON.parse(response)
      end
    end
  end

end
