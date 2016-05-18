require_relative '../../test/data/mio_export_video'

FactoryGirl.define do
  factory :mio_export_video, class: MioExportVideo do |video|
    video.section 'World & Economy'
    video.brand 'Markets and Investing'
    video.headline 'Read This Story'
    video.long_lead 'Long Lead'
    video.short_lead 'Short Lead'
    video.related_content 'http://www.example/com'
    video.credit 'Robert Nozick'
    video.video_editor 'Sophie Cohen'
  end
end
