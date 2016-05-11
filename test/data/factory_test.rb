require 'test/unit'
require_relative '../test_helper'

class FactoryTest < Test::Unit::TestCase
  include MioExceptions

  def setup
    @asset = FactoryGirl.build :mio_video_asset
  end

  def test_factory_build
    raise InvalidObjectType unless @asset.class == MioVideoAsset
  end

  def test_asset_has_a_mandatory_attribute
    raise ExpectedAttributeNotFoundError, :clip_type unless @asset.respond_to? :clip_type
  end

  def test_attributes_can_be_set
    @asset.clip_type = 'change'
    raise StandardError, 'Asset atribute not changed' unless @asset.clip_type == 'change'
  end


end