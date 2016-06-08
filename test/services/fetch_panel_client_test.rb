# frozen_string_literal: true
require 'test/unit'
require_relative '../../test/data/ws_user'
require_relative '../../lib/web_service_clients/fetch_panel_webservice_client'
require_relative '../test_helper'

class FetchPanelClientTest < MioTest

  TEST_FETCH_URL = "#{Config::Constants::MIO_ROOT_URL}/api/metadataDefinitions/11312/definition"

  def setup
    @mio_fetch_panels_client = FetchPanelWebserviceClient.new(WSUser.new, TEST_FETCH_URL)
    @mio_cached_client = FetchPanelWebserviceClient.new(WSUser.new, 'https://www.google.co.uk')
  end

  def test_get_panel_elements
    elements = @mio_fetch_panels_client.extract_panel_elements
    raise "Element #{elements.class} is not a Hash" unless
        elements.class.equal? Hash
  end

  def test_get_text_fields
    text_fields = @mio_fetch_panels_client.extract_text_field_elements
    text_fields.each do |key, value|
      raise "#{key} is not a text field (#{value}" unless value == 'text'
    end
  end

  def test_get_selectors
    selectors = @mio_fetch_panels_client.extract_selector_elements
    selectors.each do |key, value|
      raise "#{key} is not a selector (#{value}" unless value == 'single-option'
    end
  end

  def test_retrieve_panel_definitions
    definitions = @mio_fetch_panels_client.retrieve_panel_definitions
    raise "Element #{definitions.class} is not an Array" unless
        definitions.class.equal? Array
  end

  def test_fetch_panel_description_by_id
    panel_description = @mio_fetch_panels_client.fetch_panel_description_by_id(11_518)
    assert((panel_description.has_key? 'name'))
  end

end
