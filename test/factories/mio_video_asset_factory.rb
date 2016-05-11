require_relative '../../test/data/mio_video_asset'

FactoryGirl.define do
  factory :mio_video_asset, class: MioVideoAsset do |asset|
    asset.clip_type ''
    asset.description 'AT Test Clip'
    asset.location ''
    asset.interviewee 'AT Test Interviewee'
    asset.ft_office ''
    asset.producer ''
    asset.freelance_producer ''
    asset.reporter_writer_1 'AT Reporter Writer 1'
    asset.reporter_writer_2 'AT Reporter Writer 2'
    asset.reporter_writer_3 'AT Reporter Writer 3'
    asset.restrictions 'no'
    asset.restriction_description 'AT restriction description'
  end
end