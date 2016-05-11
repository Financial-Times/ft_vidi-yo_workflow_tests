require 'test/unit'
require_relative '../test_helper'
require_relative 'mio_video_asset'

class MioVideoAssetTest < Test::Unit::TestCase
  include MioExceptions

  def setup
    @default_video_asset = FactoryGirl.build :mio_video_asset
  end

  def test_asset_created
    raise InvalidObjectType unless @default_video_asset.class.equal? MioVideoAsset
  end

  def test_attributes_present
    #TODO: Complete when mandatory attributes confirmed
    raise AttributeNotFoundException unless @default_video_asset.respond_to? :clip_type
    raise AttributeNotFoundException unless @default_video_asset.clip_type.length > 0
  end


end