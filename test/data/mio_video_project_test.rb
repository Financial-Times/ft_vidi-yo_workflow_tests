# frozen_string_literal: true
require 'test/unit'
require_relative '../test_helper'
require_relative '../../config/config'

class MioVideoProjectTest < MioTest

  def setup
    @default_video_project = FactoryGirl.build :mio_video_project
  end

  def test_attributes_present
    assert_respond_to(@default_video_project, :project_name)
  end

end
