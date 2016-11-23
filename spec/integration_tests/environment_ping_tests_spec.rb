# require 'rspec'
# require_relative '../spec_helper'
# require_relative '../../config/config'
# require_relative '../../lib/webservice_clients/workflows/end_to_end_workflow'
# require_relative '../../test/data/ws_user'
#
# describe 'environment ping' do
#
#   context 'check that web services are responding on all environments' do
#
#     it 'can retrieve metadata on each environment' do
#
#       urls=%w('https://master-flex-jemdev.ft.com/api')
#       puts 'Checking URLS: ' + urls.to_s
#
#       urls.each do |url|
#         puts 'Checking ' + url
#         metadata = MetadataDescriptionWebserviceClient.new(WSUser.new, url)
#                        .retrieve_description_metadata
#         expect(metadata).to respond_to :each
#       end
#
#     end
#
#   end
# end