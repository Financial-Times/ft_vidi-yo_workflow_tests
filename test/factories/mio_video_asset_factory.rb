require_relative '../../test/data/mio_video_asset'

FactoryGirl.define do
  factory :full_mio_video_asset, class: MioVideoAsset do |asset|
    asset.clip_type 'Int'
    asset.description 'AT Test Clip'
    asset.location 'Edinburgh, Scotland'
    asset.ft_office 'London Studio'
    asset.producer 'Steve Ager'
    asset.reporter_writer_1 'AT Reporter Writer 1'
    asset.no_restrictions true

    asset.freelance_producer 'Rita Jones'
    asset.reporter_writer_2 'AT Reporter Writer 2'
    asset.reporter_writer_3 'AT Reporter Writer 3'
    asset.interviewee 'Michael Bloomberg'
    asset.has_restrictions false
    asset.restriction_description 'AT restriction description'

  end

  factory :default_mio_video_asset, class: MioVideoAsset do |asset|
    asset.clip_type 'Int'
    asset.description 'AT Test Clip'
    asset.location 'Edinburgh, Scotland'
    asset.ft_office 'London Studio'
    asset.producer 'Steve Ager'
    asset.reporter_writer_1 'AT Reporter Writer 1'
    asset.no_restrictions true

    asset.freelance_producer 'Rita Jones'
    asset.reporter_writer_2 'AT Reporter Writer 2'
    asset.reporter_writer_3 'AT Reporter Writer 3'
    asset.interviewee 'Michael Bloomberg'
    asset.has_restrictions false
    asset.restriction_description 'AT restriction description'

  end

end
