require_relative '../../test/data/mio_video_project'

FactoryGirl.define do
  factory :mio_video_project, class: MioVideoProject do |asset|
    asset.project_name 'AT Test Project'
    asset.section 'Markets and Investment'
    asset.brand 'FT World'
  end
end
