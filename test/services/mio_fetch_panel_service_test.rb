require 'test/unit'
require_relative '../../test/data/ws_user'
require_relative '../../lib/services/mio_fetch_panel_service'

class MioFetchPanelServiceTest < MioTest

  def setup
    @mio_client = MioFetchPanelService.new(WSUser.new)
    @mio_cached_client = MioFetchPanelService.new(WSUser.new, 'https://www.google.co.uk')
  end

  def test_get_panel_elements
    elements = @mio_client.extract_panel_elements
    raise "Element #{elements.class} is not a Hash" unless
        elements.class.equal? Hash
  end

  def test_get_text_fields
    text_fields = @mio_client.extract_text_field_elements
    text_fields.each do |key, value|
      raise "#{key} is not a text field (#{value}" unless value == 'text'
    end
  end

  def test_get_selectors
    selectors = @mio_client.extract_selector_elements
    selectors.each do |key, value|
      raise "#{key} is not a selector (#{value}" unless value == 'single-option'
    end
  end

  def test_get_panel_definitions
    definitions = @mio_client.retrieve_panel_definitions
    raise "Element #{definitions.class} is not an Array" unless
        definitions.class.equal? Array
  end

end
