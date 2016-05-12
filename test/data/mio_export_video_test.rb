require 'test/unit'
require_relative '../test_helper'
require_relative 'mio_export_video'

class MioExportVideoTest < MioTest

  include MioExceptions


  def setup
    @mio_export_video = FactoryGirl.build :mio_export_video
    @data_attributes=%i{:section :brand}

  end
  #TODO: Refactor to loop to avoid repetition - respond_to? argument doesn't work in iterator at present

  def test_has_section
    raise AttributeNotFoundException  unless @mio_export_video.respond_to? :section
  end

  def test_has_brand
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :brand
  end

  def test_has_long_lead
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :long_lead
  end

  def test_has_short_lead
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :short_lead
  end

  def test_has_related_content
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :related_content
  end

  def test_has_credit
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :credit
  end

  def test_has_video_editor
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :video_editor
  end

  def test_has_ft_office
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :ft_office
  end

  def test_has_producer
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :producer
  end

  def test_has_freelance_video_editor
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :freelance_video_editor
  end

  def test_has_has_restrictions
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :has_restrictions
  end

  def test_has_no_restrictions
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :no_restrictions
  end

  def test_has_restrictions_description
    raise AttributeNotFoundException unless @mio_export_video.respond_to? :restriction_description
  end


end