require 'test/unit'
require_relative '../test_helper'

class MioVideoProjectTest <  MioTest


  def setup
    @default_video_project = FactoryGirl.build :mio_video_project
  end

  def test_attributes_present
    raise AttributeNotFoundException unless @default_video_project.respond_to? :project_name
    raise AttributeNotFoundException unless @default_video_project.project_name.length > 0
  end



end