require 'test/unit'
require 'rest-client'
require_relative '../pages/mio_test'
require_relative '../../test/data/ws_user'
require_relative '../../lib/services/mio_ws_client'

class MioRestClientTest < MioTest

  def setup
    @mio_client = MioWSClient.new(WSUser.new, 'https://master.dev.nativ-systems.com/api/metadataDefinitions/11312/definition')
    @mio_cache_client = MioWSClient.new(WSUser.new, 'https://master.dev.nativ-systems.com/api/metadataDefinitions/11312/definition')
  end

  def test_returns_hash
    metadata = @mio_client.get_metadata
    fail "No Hash returned (#{metadata.class})" unless metadata.is_a? Hash
  end



end