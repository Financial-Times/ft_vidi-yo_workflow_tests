require 'test/unit'
require_relative '../test_helper'
require_relative 'mio_video_asset'

class MioVideoAssetTest < MioTest

  def setup
    @full_video_asset = FactoryGirl.build :default_mio_video_asset
  end

  def test_asset_created
    assert_kind_of(MioVideoAsset, @full_video_asset)
  end

  def test_attributes_present
    # TODO: Complete when mandatory attributes confirmed
    assert_respond_to(@full_video_asset, :clip_type)
  end

  def test_asset_has_a_mandatory_attribute
    assert_respond_to(@full_video_asset, :clip_type)
  end

  def test_attributes_can_be_set
    @full_video_asset.clip_type = 'change'
    assert_equal(@full_video_asset.clip_type, 'change')
  end

end
