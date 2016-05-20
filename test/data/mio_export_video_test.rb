require 'test/unit'
require_relative '../test_helper'
require_relative 'mio_export_video'

class MioExportVideoTest < MioTest

  include MioExceptions

  def setup
    @mio_export_video = FactoryGirl.build :mio_export_video
    @data_attributes = %i(:section :brand)
  end

  # TODO: Refactor to loop to avoid repetition - service not ready yet

  def test_has_section
    assert_respond_to(@mio_export_video, :section)
  end

  def test_has_brand
    assert_respond_to(@mio_export_video, :brand)
  end

  def test_has_long_lead
    assert_respond_to(@mio_export_video, :long_lead)
  end

  def test_has_short_lead
    assert_respond_to(@mio_export_video, :short_lead)
  end

  def test_has_related_content
    assert_respond_to(@mio_export_video, :related_content)
  end

  def test_has_credit
    assert_respond_to(@mio_export_video, :credit)
  end

  def test_has_video_editor
    assert_respond_to(@mio_export_video, :video_editor)
  end

  def test_has_ft_office
    assert_respond_to(@mio_export_video, :ft_office)
  end

  def test_has_producer
    assert_respond_to(@mio_export_video, :producer)
  end

  def test_has_freelance_video_editor
    assert_respond_to(@mio_export_video, :freelance_video_editor)
  end

  def test_has_has_restrictions
    assert_respond_to(@mio_export_video, :has_restrictions)
  end

  def test_has_no_restrictions
    assert_respond_to(@mio_export_video, :no_restrictions)
  end

  def test_has_restriction_description
    assert_respond_to(@mio_export_video, :restriction_description)
  end

end
