require 'test/unit'
require_relative '../test_helper'
require_relative 'mio_video_asset'

class MioVideoAssetTest < MioTest

  include MioExceptions

  def setup
    @full_video_asset = FactoryGirl.build :default_mio_video_asset
  end

  def test_asset_created
    raise InvalidObjectType unless @full_video_asset.class.equal? MioVideoAsset
  end

  def test_attributes_present
    # TODO: Complete when mandatory attributes confirmed
    raise AttributeNotFoundException unless @full_video_asset.respond_to? :clip_type
    raise AttributeNotFoundException if @full_video_asset.clip_type.empty?
  end

  def test_asset_has_a_mandatory_attribute
    raise ExpectedAttributeNotFoundError, :clip_type unless @full_video_asset.respond_to? :clip_type
  end

  def test_attributes_can_be_set
    @full_video_asset.clip_type = 'change'
    raise StandardError, 'Asset atribute not changed' unless @full_video_asset.clip_type == 'change'
  end

end
