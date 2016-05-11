require_relative '../../test/data/mio_video_asset'

FactoryGirl.define do
  factory :mio_video_asset, class: MioVideoAsset do |asset|
    asset.clip_type 'Int'
    asset.description 'AT Test Clip'
    asset.location 'Edinburgh, Scotland'
    asset.ft_office 'One Southwark Bridge'
    asset.producer 'Steve Ager'
    asset.reporter_writer_1 'AT Reporter Writer 1'
    asset.no_restrictions 'No'

    trait :non_mandatory do
      asset.freelance_producer 'Rita Jones'
      asset.reporter_writer_2 'AT Reporter Writer 2'
      asset.reporter_writer_3 'AT Reporter Writer 3'
      asset.interviewee 'Michael Bloomberg'
      asset.has_restrictions'Yes'
      asset.restriction_description 'AT restriction description'
    end

  end
end